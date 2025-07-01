import 'package:ela_salaty/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:ela_salaty/service/salat_service.dart';
import 'package:dio/dio.dart';
import 'package:ela_salaty/service/time_service.dart';

void main() {
  runApp(const ElaSalaty());
}

class ElaSalaty extends StatelessWidget {
  const ElaSalaty({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

