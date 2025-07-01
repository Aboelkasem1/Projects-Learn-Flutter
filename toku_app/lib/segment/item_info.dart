import 'package:flutter/material.dart';
import 'package:toku_app/models/item_model.dart';

class ItemInfo extends StatelessWidget {
  ItemInfo({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: item.color,
      height: 100,
      width: double.infinity,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(
                      item.txtJapn,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 2),
                    child: Text(
                      item.txtEnglish,
                      style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
        
            IconButton(
              onPressed: () {
                item.playSound();
              },

              icon: Icon(Icons.play_arrow, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
