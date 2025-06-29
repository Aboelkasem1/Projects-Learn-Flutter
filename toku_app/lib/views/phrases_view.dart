import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';
import 'package:toku_app/models/item_model.dart';
import 'package:toku_app/segment/item_info.dart';
import 'package:toku_app/segment/pages_item.dart';

class PhrasesView extends StatelessWidget {
  final ItemCourse itemCourse;
  PhrasesView({super.key, required this.itemCourse});

  final List<Item> items = [
    Item(
      txtJapn: 'kimasu ka?', // Are you coming?
      txtEnglish: 'Are you coming?',
      sound: 'sounds/phrases/are_you_coming.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'chane toku warnide kudasi', // Don’t forget to subscribe
      txtEnglish: 'Don’t forget to subscribe',
      sound: 'sounds/phrases/dont_forget_to_subscribe.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'chōshi wa dō desu ka?', // How are you feeling?
      txtEnglish: 'How are you feeling?',
      sound: 'sounds/phrases/how_are_you_feeling.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'anime ga daisuki desu', // I love anime
      txtEnglish: 'I love anime',
      sound: 'sounds/phrases/i_love_anime.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'prograingu ga daisuki desu', // I love programming
      txtEnglish: 'I love programming',
      sound: 'sounds/phrases/i_love_programming.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'purogrming a kantn desu', // Programming is easy
      txtEnglish: 'Programming is easy',
      sound: 'sounds/phrases/programming_is_easy.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'onamae wa nan desu ka?', // What is your name?
      txtEnglish: 'What is your name?',
      sound: 'sounds/phrases/what_is_your_name.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'doko e iku no?', // Where are you going?
      txtEnglish: 'Where are you going?',
      sound: 'sounds/phrases/where_are_you_going.wav',
      color: Colors.brown,
    ),
    Item(
      txtJapn: 'hai, ikimasu', // Yes, I’m coming
      txtEnglish: 'Yes, I’m coming',
      sound: 'sounds/phrases/yes_im_coming.wav',
      color: Colors.brown,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          itemCourse.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: itemCourse.color,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemInfo(item: items[index]);
        },
      ),
    );
  }
}
