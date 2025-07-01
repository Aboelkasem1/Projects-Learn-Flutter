import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';
import 'package:toku_app/segment/home_item.dart';
import 'package:toku_app/views/colors_view.dart';
import 'package:toku_app/views/family_view.dart';
import 'package:toku_app/views/numbers_view.dart';
import 'package:toku_app/views/phrases_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 10),
          child: Icon(Icons.home, size: 50, color: Color(0xFFB2DFDB)),
        ),
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 32,
            color: Color.fromARGB(255, 238, 244, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 28, 34, 41),
      ),

      body: SafeArea(
        child: ListView(
          children: viewPages(),
        ),
      ),

      backgroundColor: Color(0xffF5F5F5),
    );
  }

  List<ItemCourse> items = [

    ItemCourse(title: "Numbers", color: Color(0xff00796B)), //modified
    ItemCourse(title: "Family", color: Color(0xffE64A19)), //modified
    ItemCourse(title: "Colors", color: Color(0xff303F9F)), //modified
    ItemCourse(title: "Phrases", color: Color(0xff388E3C)), //modified
  ];

  List<Widget> pages = [
    NumbersView(
      itemCourse: ItemCourse(
        title: "Numbers",
        color: Color(0xff00796B),
      ), //modified
    ),
    FamilyView(
      itemCourse: ItemCourse(
        title: "Family",
        color: Color(0xffE64A19),
      ), //modified
    ),
    ColorsView(
      itemCourse: ItemCourse(
        title: "Colors",
        color: Color(0xff303F9F),
      ), //modified
    ),
    PhrasesView(
      itemCourse: ItemCourse(
        title: "Phrases",
        color: Color(0xff388E3C),
      ), //modified
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
