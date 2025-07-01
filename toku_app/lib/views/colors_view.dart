import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';
import 'package:toku_app/models/item_model.dart';
import 'package:toku_app/segment/pages_item.dart';

class ColorsView extends StatelessWidget {
  final ItemCourse itemCourse;
  ColorsView({super.key, required this.itemCourse});

  final List<ItemModel> colors = [
    ItemModel(
      txtJapn: "Aka",
      txtEnglish: "red",
      img: "assets/images/colors/color_red.png",
      sound: "sounds/colors/red.mp3",
      color: Color(0xFFE8EAF6),
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "white",
      img: "assets/images/colors/color_white.png",
      sound: "sounds/colors/white.mp3",
      color: Color(0xFFE8EAF6),
    ),
    ItemModel(
      txtJapn: "Kuro",
      txtEnglish: "black",
      img: "assets/images/colors/color_black.png",
      sound: "sounds/colors/black.mp3",
      color: Color(0xFFE8EAF6),
    ),
    ItemModel(
      txtJapn: "Chairo",
      txtEnglish: "brown",
      img: "assets/images/colors/color_brown.png",
      sound: "sounds/colors/brown.mp3",
      color: Color(0xFFE8EAF6),
    ),
    ItemModel(
      txtJapn: "Gurē",
      txtEnglish: "gray",
      img: "assets/images/colors/color_gray.png",
      sound: "sounds/colors/gray.mp3",
      color: Color(0xFFE8EAF6),
    ),
    ItemModel(
      txtJapn: "Midori",
      txtEnglish: "green",
      img: "assets/images/colors/color_green.png",
      sound: "sounds/colors/green.mp3",
      color: Color(0xFFE8EAF6),
    ),
    ItemModel(
      txtJapn: "Kiiro",
      txtEnglish: "yellow",
      img: "assets/images/colors/yellow.png",
      sound: "sounds/colors/yellow.mp3",
      color: Color(0xFFE8EAF6),
    ),
    ItemModel(
      txtJapn: "Dasutiierō",
      txtEnglish: "dusty_yellow",
      img: "assets/images/colors/color_dusty_yellow.png",
      sound: "sounds/colors/dusty_yellow.mp3",
      color: Color(0xFFE8EAF6),
    ),

  ];
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

      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return PagesItem(itemModel: colors[index]);
        },
      ),
    );
  }
}
