import 'package:flutter/material.dart';
import 'package:news_app/models/category_main_item_model.dart';
import 'package:news_app/views/news_category_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.topItemModel});

  final CategoryMainItemModel topItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NewsCategoryView(category: topItemModel.name);
            },
          ),
        );
      },
      child: Container(
        height: 100,
        width: 200,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          image: DecorationImage(
            image: AssetImage(topItemModel.img),
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
      ),
    );
  }
}
