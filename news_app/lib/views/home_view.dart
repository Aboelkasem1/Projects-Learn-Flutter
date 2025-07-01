import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/down_item_model.dart';
import 'package:news_app/models/top_item_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/category_item.dart';
import 'package:news_app/widgets/list_down_item.dart';
import 'package:news_app/widgets/list_top_item.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(color: Colors.black)),
            Text('Cloud', style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 100,
                    child: ListTopItem(),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                  child: NewsListViewBuilder(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
