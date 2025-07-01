import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ela_salaty/models/salat_model.dart';
import 'package:ela_salaty/service/salat_service.dart';
import 'package:ela_salaty/widgets/date_of_day.dart';
import 'package:flutter/material.dart';

class SalatAlan extends StatefulWidget {
  const SalatAlan({super.key});

  @override
  State<SalatAlan> createState() => _SalatAlanState();
}

class _SalatAlanState extends State<SalatAlan> {
  List<SalatModel> salatModel = [SalatModel("", name: "", time: "")];
  SalatModel? nextPrayer;
  String remainingTime = "";
  late String time;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _loadSalatData();
    _updateTime();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  Future<void> _loadSalatData() async {
    salatModel = await SalatService(dio: Dio()).getNews();
    setState(() {});
  }

  void _updateTime() {
    final now = DateTime.now();
    time =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    // تحديد الصلاة القادمة
    nextPrayer = getNextPrayer();

    if (nextPrayer != null) {
      remainingTime = getRemainingTime(nextPrayer!.time);
    } else {
      remainingTime = "انتهت الصلوات";
    }

    setState(() {});
  }

  DateTime getSalatDateTime(String time) {
    final now = DateTime.now();
    final parts = time.split(":");
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  SalatModel? getNextPrayer() {
    final now = DateTime.now();
    for (final salat in salatModel) {
      if (salat.time.isEmpty) continue;
      final salatTime = getSalatDateTime(salat.time);
      if (salatTime.isAfter(now)) return salat;
    }
    return null;
  }

  String getRemainingTime(String salatTime) {
    final now = DateTime.now();
    final target = getSalatDateTime(salatTime);
    final diff = target.difference(now);

    if (diff.isNegative) return "00:00:00";

    final hours = diff.inHours.toString().padLeft(2, '0');
    final minutes = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (diff.inSeconds % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(170, 0, 0, 0),
                borderRadius: BorderRadius.circular(150),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nextPrayer != null
                        ? nextPrayer!.name
                        : "لا توجد صلاة قادمة",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF2F2F2),
                    ),
                  ),
                  Text(
                    nextPrayer != null ? nextPrayer!.time : "--:--",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF2F2F2),
                    ),
                  ),
                  Text(
                    nextPrayer != null
                        ? "$remainingTime :باقي"
                        : "انتهت الصلوات",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF2F2F2),
                    ),
                  ),
                ],
              ),
            ),
            DateOfDay(date: salatModel.first.formDate),
          ],
        ),
      ),
    );
  }
}
