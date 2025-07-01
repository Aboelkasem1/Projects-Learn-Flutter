import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/down_item_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/models/top_item_model.dart';
import 'package:news_app/widgets/category_down_item.dart';
import 'package:dio/dio.dart';

class ListDownItem extends StatefulWidget {
  ListDownItem({super.key});

  @override
  State<ListDownItem> createState() => _ListDownItemState();
}

class _ListDownItemState extends State<ListDownItem> {
  List<ArticleModel> items = [];

  initState() {
    newMethodService();
    super.initState();
  }

  Future<void> newMethodService() async {
    items = await NewsService(dio: Dio()).getNews();
    setState(() {});
  }
  // List<DownItemModel> items =
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CategoryDownItem(items: items[index]);
      },
    );

    // return SingleChildScrollView(child: Column(children: childern()));
  }
}
