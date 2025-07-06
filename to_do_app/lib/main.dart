import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/model.dart';
import 'package:to_do_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<Model>(
        create: (context) => Model(),
        child: Homepage(),
      ),
    );
  }
}
