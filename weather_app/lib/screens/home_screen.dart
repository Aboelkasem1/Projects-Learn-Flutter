import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_bar_widget.dart';
import 'package:weather_app/widgets/show_Info_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ShowInfoWeatherWidget(),
    );
  }
}
