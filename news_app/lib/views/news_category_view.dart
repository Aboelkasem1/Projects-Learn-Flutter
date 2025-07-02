import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_builder.dart';

class NewsCategoryView extends StatelessWidget {
  const NewsCategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromARGB(255, 238, 234, 231),
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          category[0].toUpperCase() + category.substring(1),
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 238, 234, 231),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 197, 125, 17),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                NewsListBuilder(category: category),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
