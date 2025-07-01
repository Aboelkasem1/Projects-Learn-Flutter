import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';
import 'package:toku_app/models/item_model.dart';
import 'package:toku_app/segment/pages_item.dart';

class NumbersView extends StatelessWidget {
  NumbersView({super.key, required this.itemCourse});

  final ItemCourse itemCourse;
  final List<ItemModel> numbers = [
    ItemModel(
      txtJapn: "ichi",
      txtEnglish: "one",
      img: "assets/images/numbers/number_one.png",
      sound: "sounds/numbers/number_one_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "ni",
      txtEnglish: "two",
      img: "assets/images/numbers/number_two.png",
      sound: "sounds/numbers/number_two_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "san",
      txtEnglish: "three",
      img: "assets/images/numbers/number_three.png",
      sound: "sounds/numbers/number_three_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "yon",
      txtEnglish: "four",
      img: "assets/images/numbers/number_four.png",
      sound: "sounds/numbers/number_four_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "go",
      txtEnglish: "five",
      img: "assets/images/numbers/number_five.png",
      sound: "sounds/numbers/number_five_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "roku",
      txtEnglish: "six",
      img: "assets/images/numbers/number_six.png",
      sound: "sounds/numbers/number_six_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "shichi",
      txtEnglish: "seven",
      img: "assets/images/numbers/number_seven.png",
      sound: "sounds/numbers/number_seven_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "hachi",
      txtEnglish: "eight",
      img: "assets/images/numbers/number_eight.png",
      sound: "sounds/numbers/number_eight_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "kyu",
      txtEnglish: "nine",
      img: "assets/images/numbers/number_nine.png",
      sound: "sounds/numbers/number_nine_sound.mp3",
      color: Color(0xFFB2DFDB),
    ),
    ItemModel(
      txtJapn: "jyu",
      txtEnglish: "ten",
      img: "assets/images/numbers/number_ten.png",
      sound: "sounds/numbers/number_ten_sound.mp3",
      color: Color(0xFFB2DFDB),
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
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: itemCourse.color,
      ),

      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return PagesItem(itemModel: numbers[index]);
        },
      ),
    );
  }
}