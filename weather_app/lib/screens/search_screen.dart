import 'package:flutter/material.dart';
import 'package:weather_app/widgets/text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFieldWidget(),
      ),
    );
  }
}