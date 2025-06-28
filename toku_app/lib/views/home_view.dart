import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';
import 'package:toku_app/segment/home_item.dart';
import 'package:toku_app/views/colors_view.dart';
import 'package:toku_app/views/family_view.dart';
import 'package:toku_app/views/numbers_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),

      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return HomeItem(
              itemCourse: items[index],
              pageName: NumbersView(itemCourse: items[index]),
            );
          },
        ),
      ),
    );
  }

  List<ItemCourse> items = [
    ItemCourse(title: "Numbers", color: Colors.red),
    ItemCourse(title: "Family", color: Colors.lightBlue),
    ItemCourse(title: "Colors", color: Colors.deepPurpleAccent),
    ItemCourse(title: "Phrases", color: Colors.teal),
  ];
}
