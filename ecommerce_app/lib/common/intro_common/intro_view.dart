import 'package:ecommerce_app/models/item_intro_view.dart';
import 'package:ecommerce_app/pages/intro_page.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  IntroView({super.key, required this.index});
  final int index;

  List<ItemIntroView> items = [
    ItemIntroView(x: 1, title: "Welcome to my app", src: "assets/Image1.jpg"),
    ItemIntroView(x: -1, title: "This is the second page", src: "assets/Image2.jpg"),
    ItemIntroView(x: 0, title: "This is the third page", src: "assets/Image.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: index == 1 ? Radius.circular(5) : Radius.circular(50),
          topRight: index == 0 ? Radius.circular(5) : Radius.circular(50),

          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),

        ),
      ),

      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment(items[index].x, 0),
              child: Image(image: AssetImage(items[index].src)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              items[index].title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
