import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';

class HomeItem extends StatelessWidget {
  final ItemCourse itemCourse;
  final Widget pageName;
  const HomeItem({super.key, required this.itemCourse, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return pageName;
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        height: 100,
        color: itemCourse.color,
        child: Text(
          itemCourse.title,
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
