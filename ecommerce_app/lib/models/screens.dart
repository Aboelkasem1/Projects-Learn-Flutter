import 'package:ecommerce_app/pages/home_screens/cart_screen.dart';
import 'package:ecommerce_app/pages/home_screens/home_screen.dart';
import 'package:ecommerce_app/pages/home_screens/profile_screen.dart';
import 'package:flutter/material.dart';

class Screens extends ChangeNotifier {
  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  int num = 0;
  changePage(int i){
    num = i;
    notifyListeners();
  }
}
