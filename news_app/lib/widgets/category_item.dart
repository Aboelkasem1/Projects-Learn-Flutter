import 'package:flutter/material.dart';
import 'package:news_app/models/top_item_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.topItemModel});

  final TopItemModel topItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 100,
              width: 200,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                image: DecorationImage(
                  image: AssetImage(
                    topItemModel.img,
                  ),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Color.fromARGB(70, 0, 0, 0),
                    BlendMode.hardLight,
                  ),
                ),
              ),

              child: Center(
                child: Text(
                  topItemModel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
  }
}