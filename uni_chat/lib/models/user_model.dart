import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  UserCredential? user;

  void setUser(UserCredential newUser) {
    user = newUser;
    notifyListeners();
  }

  User? get currentUser => user?.user;
}
