import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';

class ColorsView extends StatelessWidget {
  final ItemCourse itemCourse;
  const ColorsView({super.key, required this.itemCourse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          itemCourse.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: itemCourse.color,
      ),
    );
  }
}
