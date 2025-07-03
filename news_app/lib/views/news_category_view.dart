import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_builder.dart';

class NewsCategoryView extends StatelessWidget {
  const NewsCategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          category,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 225, 149, 36),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                NewsListBuilder(category: category.toLowerCase()),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
