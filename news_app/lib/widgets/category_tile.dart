import 'package:flutter/material.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/widgets/subcategory_tile.dart';
import 'package:webview_flutter/webview_flutter.dart';


class CategoryTile extends StatelessWidget {

  final List<NewsArticleModel> items;

  CategoryTile({required this.items});

  // List<DownItemModel> items =
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SafeArea(
                    child: WebViewWidget(
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..loadRequest(Uri.parse(items[index].url!)),
                    ),
                  );
                },
              ),
            );
          },
          child: SubcategoryTile(items: items[index]),
        );
      },
    );

    // return SingleChildScrollView(child: Column(children: childern()));
  }
}
