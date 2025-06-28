import 'package:flutter/material.dart';
import 'package:toku_app/models/item_model.dart';

class ItemInfo extends StatelessWidget {
  ItemInfo({super.key, required this.itemModel});
  final ItemModel itemModel;
  
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),


                IconButton(
                  onPressed: () {
                    itemModel.playSound();
                  },
            
                  icon: Icon(Icons.play_arrow, color: Colors.black),
                ),
              ],
            );
  }
}