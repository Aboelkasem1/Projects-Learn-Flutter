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
        child: ListView(
          children: viewPages(),
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

  List<Widget> pages = [
    NumbersView(
      itemCourse: ItemCourse(title: "Numbers", color: Colors.red),
    ),
    FamilyView(
      itemCourse: ItemCourse(title: "Family", color: Colors.lightBlue),
    ),
    ColorsView(
      itemCourse: ItemCourse(title: "Colors", color: Colors.deepPurpleAccent),
    ),
  ];

  List<HomeItem> viewPages() {
    List<HomeItem> list = [];
    for (int i = 0; i < pages.length; i++) {
      list.add(HomeItem(itemCourse: items[i], pageName: pages[i]));
    }

    return list;
  }
}
