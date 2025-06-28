import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';

class NumbersView extends StatelessWidget {
  const NumbersView({super.key, required this.itemCourse});

  final ItemCourse itemCourse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          itemCourse.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: itemCourse.color,
      ),
    );
  }
}