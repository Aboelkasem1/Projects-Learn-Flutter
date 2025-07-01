import 'package:dio/dio.dart';
import 'package:ela_salaty/models/salat_model.dart';
import 'package:ela_salaty/service/salat_service.dart';
import 'package:ela_salaty/widgets/category_salat.dart';
import 'package:flutter/material.dart';

class RowCenter extends StatefulWidget {
  const RowCenter({super.key});

  @override
  State<RowCenter> createState() => _RowCenterState();
}

class _RowCenterState extends State<RowCenter> {
  List<SalatModel> salatModel = [];

  @override
  void initState() {
    super.initState();
    SalatGet();
  }

  Future<void> SalatGet() async {
    List<SalatModel> result = await SalatService(dio: Dio()).getNews();

    // ترتيب الصلاة الصحيح
    List<String> order = ["العشاء", "المغرب", "العصر", "الظهر", "الفجر"];
    result.sort(
      (a, b) => order.indexOf(a.name).compareTo(order.indexOf(b.name)),
    );

    DateTime now = DateTime.now();

    // تحديد الصلاة القادمة
    int nextIndex = result.indexWhere((s) {
      final parts = s.time.split(":");
      final h = int.parse(parts[0]);
      final m = int.parse(parts[1]);
      final prayerTime = DateTime(now.year, now.month, now.day, h, m);
      return prayerTime.isAfter(now);
    });

    // لو مفيش صلاة جاية (مثلاً بعد العشاء) نبدأ من أول وحدة
    if (nextIndex == -1) nextIndex = 0;

    // نبدأ من بعد الصلاة القادمة
    int afterNext = (nextIndex + 1) % result.length;

    salatModel = [
      ...result.sublist(afterNext),
      ...result.sublist(0, afterNext),
    ];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: salatModel
            .take(4) // نعرض فقط 4 صلوات بعد القادمة
            .map((s) => CategorySalat(salatModel: s))
            .toList(),
      ),
    );
  }
}
