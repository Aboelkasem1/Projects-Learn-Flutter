import 'package:to_do_app/main.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/body_widget.dart';
import 'package:to_do_app/widgets/complate_tasks.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nameController = "";

  void addTask(String name) {
    setState(() {
      tasks.add(TaskModel(name: name, state: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff243545),
        title: Text(
          "Taskes",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),

      body: CustomScrollView(
        slivers: [
          BodyWidget(),
          SliverToBoxAdapter(
            child: Divider(
              color: Colors.black,
              thickness: 2,
              height: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),
          CompleteTasks(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff243545),
        onPressed: () {
          String taskName = "";
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Task"),
                content: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Enter your task"),
                  onChanged: (value) {
                    taskName = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      if (taskName.trim().isNotEmpty) {
                        addTask(taskName.trim());
                      }
                      Navigator.pop(context);
                    },
                    child: Text("Add"),
                  ),
                ],
                buttonPadding: EdgeInsets.all(20),
              );
            },
          );
        },
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
