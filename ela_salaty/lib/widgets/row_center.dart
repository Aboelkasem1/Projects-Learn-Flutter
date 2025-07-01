import 'package:ela_salaty/models/salat_model.dart';
import 'package:ela_salaty/widgets/category_salat.dart';
import 'package:flutter/material.dart';

class RowCenter extends StatelessWidget {
  const RowCenter({super.key});

  final List <SalatModel> salatModel = const [
    SalatModel(name: "الفجر", time: "04:15"),
    SalatModel(name: "الظهر", time: "01:00"),
    SalatModel(name: "المغرب", time: "08:00"),
    SalatModel(name: "العشاء", time: "9:30"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategorySalat(salatModel: salatModel[1]),
          CategorySalat(salatModel: salatModel[0]),
          CategorySalat(salatModel: salatModel[3]),  
          CategorySalat(salatModel: salatModel[2]),
        ],
      ),
    );
  }
}
