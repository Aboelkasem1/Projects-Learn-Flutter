import 'package:ecommerce_app/common/home_common/home_nav_bar.dart';
import 'package:ecommerce_app/models/item_model.dart';
import 'package:ecommerce_app/models/screens.dart';
import 'package:ecommerce_app/pages/home_screens/cart_screen.dart';
import 'package:ecommerce_app/pages/home_screens/home_screen.dart';
import 'package:ecommerce_app/pages/home_screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Screens()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
      ],
      builder: (context, child) {
        return Consumer<Screens>(
          builder: (context, page, child) => Scaffold(
            body: PageView(
              children: [
                page.screens[page.num],
              ],
              onPageChanged: (i) {
                page.changePage(i);
              },
            ),
            bottomNavigationBar: HomeNavBar(),
          ),
        );
      },
    );
  }
}
