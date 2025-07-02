import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_article_model.dart';

class SubcategoryTile extends StatelessWidget {
  const SubcategoryTile({
    super.key,
    required this.items,
  });

  final NewsArticleModel items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: items.urlToImage!,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
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