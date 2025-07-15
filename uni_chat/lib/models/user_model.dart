import 'package:flutter/material.dart';

class UserModel {
  final String email;
  final String name;
  final String password;
  final String? profileImage;

  UserModel({
    required this.email,
    required this.name,
    required this.password,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      password: json['password'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'profileImage': profileImage,
    };
  }
}

class UserModelList extends ChangeNotifier {
  List<UserModel> users = [
    UserModel(email: 'admin@test.com', name: 'admin',  password: '123456'),
  ];

  void addUser(UserModel user) {
    users.add(user);
    notifyListeners();
  }

  bool isUserSame({required String email, required String password}) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    return {'users': users.map((user) => user.toJson()).toList()};
  }
}
