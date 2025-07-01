import 'package:ela_salaty/models/salat_model.dart';
import 'package:flutter/material.dart';

class CategorySalat extends StatelessWidget {
  const CategorySalat({super.key, required this.salatModel});
  final SalatModel salatModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(170, 0, 0, 0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              salatModel.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffF2F2F2),
              ),
            ),
            Text(
              salatModel.time,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xffF2F2F2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
