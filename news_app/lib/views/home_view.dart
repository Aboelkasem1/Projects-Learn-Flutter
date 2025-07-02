import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_list_item.dart';
import 'package:news_app/widgets/news_list_builder.dart';

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
                CategoryListItem(),
        
                NewsListBuilder(category: "general"),                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
