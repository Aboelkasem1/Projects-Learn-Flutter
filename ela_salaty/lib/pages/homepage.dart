import 'package:ela_salaty/models/salat_model.dart';
import 'package:ela_salaty/widgets/ala_zkar.dart';
import 'package:ela_salaty/widgets/row_center.dart';
import 'package:ela_salaty/widgets/salat_alan.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home_image.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SalatAlan(salatAlan: const SalatModel(name: "صلاة الفجر", time: "5:00 AM")),
                RowCenter(),
                AlaZkar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
