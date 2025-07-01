import 'package:dio/dio.dart';
import 'package:ela_salaty/models/salat_model.dart';
import 'package:ela_salaty/service/salat_service.dart';
import 'package:ela_salaty/widgets/category_salat.dart';
import 'package:flutter/material.dart';

class RowCenter extends StatefulWidget {
  RowCenter({super.key});

  @override
  State<RowCenter> createState() => _RowCenterState();
}

class _RowCenterState extends State<RowCenter> {
  List<SalatModel> salatModel = [
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
    SalatModel(name: "", time: ""),
  ];

  initState() {
    super.initState();
    SalatGet();
  }

  Future<List<SalatModel>> SalatGet() async {
    salatModel = await SalatService(dio: Dio()).getNews();
    setState(() {});
    return salatModel;
  }

  // final List<SalatModel> salatModel = const [
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategorySalat(salatModel: salatModel[0]),
          CategorySalat(salatModel: salatModel[1]),
          CategorySalat(salatModel: salatModel[2]),
          CategorySalat(salatModel: salatModel[4]),
        ],
      ),
    );
  }
}
