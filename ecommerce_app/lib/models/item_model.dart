import 'package:flutter/material.dart';

class ItemModel extends ChangeNotifier {
  List<Items> items = [
    Items(img: "assets/iphone16.jpeg", name: "iphone16", price: 65000),
    Items(img: "assets/iphone13.jpeg", name: "iphone13", price: 45000),
    Items(img: "assets/iphone11.jpeg", name: "iphone11", price: 33000),
  ];

  List<Items> cartitems = [];

  get count => cartitems.length;
  int total_price = 0;

  get _cart => cartitems;

  add_to_cart(Items item) {
    total_price += item.price;
    cartitems.add(item);
    notifyListeners();
  }

  remove_from_cart(Items item) {
    total_price -= item.price;
    cartitems.remove(item);
    notifyListeners();
  }
}

class Items {
  final String img;
  final String name;
  final int price;
  Items({required this.img, required this.name, required this.price});
}
