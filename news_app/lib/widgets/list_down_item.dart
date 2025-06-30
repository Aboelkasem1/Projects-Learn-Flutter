import 'package:flutter/material.dart';
import 'package:news_app/models/down_item_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/models/top_item_model.dart';
import 'package:news_app/widgets/category_down_item.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();

class ListDownItem extends StatelessWidget {
  ListDownItem({super.key});

  final List<DownItemModel> items = const [
    DownItemModel(
      topTitl: "رمية القسام \"الثلاثية\" قنبلة بقلب المدرعة الإسرائيلية",
      downTitl:
          "في ملاعب غزة، تختلف قواعد اللعبة، وتعاد كتابة قوانين الاشتباك، خصوصا بعد عملية خان يونس؛ إذ لم تكن المواجهة مجرد اشتباك عسكري، بل كانت \"رمية\" محسوبة بدقة، نفذها مقاوم من كتائب القسام الذراع العسكرية لحركة حماس كما لو أنه في مباراة نهائية لكرة السلة.",
      img: "assets/pl.webp",
    ),
    
  ];

  // List<DownItemModel> items =
  //     NewsListSport(dio: Dio()).getNews() as List<DownItemModel>;

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

  // List<Widget> childern() {
  //   List<Widget> list__ = [];

  //   for (var element in items) {
  //     list__.add(CategoryDownItem(items: element));
  //   }

  //   return list__;
  // }
}
