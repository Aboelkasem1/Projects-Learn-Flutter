import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/test.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => CityName(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
