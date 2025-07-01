import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/down_item_model.dart';

class CategoryDownItem extends StatelessWidget {
  const CategoryDownItem({
    super.key,
    required this.items,
  });

  final ArticleModel items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: items.urlToImage != null
                ? Image.network(items.urlToImage!)
                : Image.asset('assets/no_image.png'),
          ),
          Text(
            items.title,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          Text(
            items.description ?? 'No description',
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