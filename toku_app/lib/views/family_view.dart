import 'package:flutter/material.dart';
import 'package:toku_app/models/item_course.dart';
import 'package:toku_app/models/item_model.dart';
import 'package:toku_app/segment/pages_item.dart';

class FamilyView extends StatelessWidget {
  FamilyView({super.key, required this.itemCourse});
  final ItemCourse itemCourse;

  final List<ItemModel> family = [
    ItemModel(
      txtJapn: "Chichioya",
      txtEnglish: "Father",
      img: "assets/images/family_members/family_father.png",
      sound: "sounds/family_members/father.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Mother",
      img: "assets/images/family_members/family_mother.png",
      sound: "sounds/family_members/mother.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Son",
      img: "assets/images/family_members/family_son.png",
      sound: "sounds/family_members/son.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Daughter",
      img: "assets/images/family_members/family_daughter.png",
      sound: "sounds/family_members/daughter.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Older Brother",
      img: "assets/images/family_members/family_older_brother.png",
      sound: "sounds/family_members/older_bother.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Younger Brother",
      img: "assets/images/family_members/family_younger_brother.png",
      sound: "sounds/family_members/younger_brohter.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Older Sister",
      img: "assets/images/family_members/family_older_sister.png",
      sound: "sounds/family_members/older_sister.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Younger Sister",
      img: "assets/images/family_members/family_younger_sister.png",
      sound: "sounds/family_members/younger_sister.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Grandfather",
      img: "assets/images/family_members/family_grandfather.png",
      sound: "sounds/family_members/grand_father.mp3",
      color: Colors.blueGrey,
    ),
    ItemModel(
      txtJapn: "Musuko",
      txtEnglish: "Grandmother",
      img: "assets/images/family_members/family_grandmother.png",
      sound: "sounds/family_members/grand_mother.mp3",
      color: Colors.blueGrey,
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
        itemCount: family.length,
        itemBuilder: (context, index) {
          return PagesItem(itemModel: family[index]); 
        },
      ),
    );
  }
}