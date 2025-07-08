import 'package:flutter/material.dart';

class pageNumber extends ChangeNotifier {
  int page = 0;
  String txt = "Next";

  change_page(int value) {
    page = value;
    if (page == 2) {
      txt = "Done";
    } else {
      txt = "Next";
    }
    notifyListeners();
  }
}
