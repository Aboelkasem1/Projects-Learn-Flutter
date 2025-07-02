import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/service/news_api_service.dart';
import 'package:news_app/widgets/category_tile.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  var items;

  initState() {
    super.initState();
    items = NewsApiService(dio: Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: FutureBuilder<List<NewsArticleModel>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return CategoryTile(items: snapshot.data!);
          }
        },
      ),
    );
  }
}





// CustomScrollView(
//         slivers: [
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(
//                   height: 100,
//                   child: ListTopItem(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),