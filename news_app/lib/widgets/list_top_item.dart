import 'package:flutter/material.dart';
import 'package:news_app/models/top_item_model.dart';
import 'package:news_app/widgets/category_item.dart';

class ListTopItem extends StatelessWidget {
  const ListTopItem({
    super.key,
  });

  final List<TopItemModel> topItemModel = const [
    TopItemModel(name: "Sports", img: "assets/sports.avif"),
    TopItemModel(name: "Entertainment", img: "assets/entertaiment.avif"),
    TopItemModel(name: "Health", img: "assets/health.avif"),
    TopItemModel(name: "Business", img: "assets/business.avif"),
    TopItemModel(name: "Science", img: "assets/science.avif"),
    TopItemModel(name: "Technology", img: "assets/technology.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, 
      itemCount: topItemModel.length,
      itemBuilder: (context, index) {
      return CategoryItem(topItemModel: topItemModel[index]);
    });
  }
}
