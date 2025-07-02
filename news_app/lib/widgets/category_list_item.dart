import 'package:flutter/material.dart';
import 'package:news_app/models/category_main_item_model.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
  });

  final List<CategoryMainItemModel> topItemModel = const [
    CategoryMainItemModel(name: "sports", img: "assets/sports.avif"),
    CategoryMainItemModel(name: "entertainment", img: "assets/entertaiment.avif"),
    CategoryMainItemModel(name: "health", img: "assets/health.avif"),
    CategoryMainItemModel(name: "business", img: "assets/business.avif"),
    CategoryMainItemModel(name: "science", img: "assets/science.avif"),
    CategoryMainItemModel(name: "technology", img: "assets/technology.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topItemModel.length,
        itemBuilder: (context, index) {
          return CategoryItem(topItemModel: topItemModel[index]);
        },
      ),
    );
  }
}
