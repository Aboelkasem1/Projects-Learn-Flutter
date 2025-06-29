import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku_app/models/item_model.dart';
import 'package:toku_app/segment/item_info.dart';

class PagesItem extends StatelessWidget {
  PagesItem({super.key, required this.itemModel});

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: itemModel.color,

      child: Row(
        
        children: [
          Container(
            color: const Color.fromARGB(179, 65, 64, 64),
            width: 100,
            child: Image.asset(
              itemModel.img,
            ),
          ),
          Expanded(
            child: ItemInfo(
              item: Item(
                txtJapn: itemModel.txtJapn,
                txtEnglish: itemModel.txtEnglish,
                sound: itemModel.sound,
                color: itemModel.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}