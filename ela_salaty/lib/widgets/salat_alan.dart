import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ela_salaty/models/salat_model.dart';
import 'package:ela_salaty/service/salat_service.dart';
import 'package:flutter/material.dart';

class SalatAlan extends StatefulWidget {
  const SalatAlan({super.key, required this.salatAlan});

  final SalatModel salatAlan;

  @override
  State<SalatAlan> createState() => _SalatAlanState();
}

class _SalatAlanState extends State<SalatAlan> {
  List<SalatModel> salatModel = [
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
  ];

  Future<void> SalatGet() async {
    salatModel = await SalatService(dio: Dio()).getNews();
    setState(() {});
  }

  late String time;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    SalatGet();
    _updateTime();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      time =
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    });
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
                    salatModel.length > 3 && salatModel[3].name.isNotEmpty
                        ? salatModel[3].name
                        : "Loading...",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF2F2F2),
                    ),
                  ),
                  Text(
                    salatModel.length > 3 && salatModel[3].time.isNotEmpty
                        ? salatModel[3].time
                        : "--:--",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF2F2F2),
                    ),
                  ),
                  Text(
                    "$time :بقي",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF2F2F2),
                    ),
                  ),
                ],
              ),
            ),
            DateOfDay(date: "الثلاثاء: 6 محرم 1447"),
          ],
        ),
      ),
    );
  }
}

class DateOfDay extends StatelessWidget {
  const DateOfDay({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: const Color.fromARGB(170, 0, 0, 0),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              date,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: const Color.fromARGB(170, 0, 0, 0),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
