import 'package:flutter/material.dart';
import 'package:news_app/models/down_item_model.dart';

class CategoryDownItem extends StatelessWidget {
  const CategoryDownItem({
    super.key,
    required this.items,
  });

  final DownItemModel items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(items.img),
          ),
          Text(
            items.topTitl,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          Text(
            items.downTitl,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}