import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/list_down_item.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> items = [];
  bool isLoding = true;

  initState() {
    newMethodService();
    super.initState();
  }

  Future<void> newMethodService() async {
    items = await NewsService(dio: Dio()).getNews();
    isLoding = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoding
        ? Align(
            child: Container(
              width: double.infinity,
              height: 560,
              color: const Color.fromARGB(0, 255, 255, 255),

              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 10,
                ),
              ),
            ),
          )
        : ListDownItem(items: items);
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