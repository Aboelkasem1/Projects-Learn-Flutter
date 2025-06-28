import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_app/models/item_model.dart';

class PagesItem extends StatelessWidget {
  const PagesItem({super.key, required this.itemModel});

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.blue,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: const Color.fromARGB(179, 224, 223, 219),
            width: 100,
            child: Image.asset(
              itemModel.img,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Text(
                    itemModel.txtJapn,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 2),
                  child: Text(
                    itemModel.txtEnglish,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Spacer(),
          IconButton(
            onPressed: () {
              itemModel.playSound();
            },
 
            icon: Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}