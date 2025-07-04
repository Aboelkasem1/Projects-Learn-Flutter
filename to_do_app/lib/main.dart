import 'package:app_to_testing/models/task_model.dart';
import 'package:app_to_testing/pages/home_page.dart';
import 'package:flutter/material.dart';

 List<TaskModel> tasks = [
    TaskModel(name: "Complete Flutter tutorial", state: false),
    TaskModel(name: "Buy groceries", state: false),
    TaskModel(name: "Prepare presentation", state: false),
    TaskModel(name: "Call mom", state: false),
    TaskModel(name: "Go to the gym", state: false),
    TaskModel(name: "Walk the dog", state: false),
  ];

  List<TaskModel> completeTasks = [];
  
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}