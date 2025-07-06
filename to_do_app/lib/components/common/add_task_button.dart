import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/model.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, model, child) {
        return FloatingActionButton(
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
                          model.addTask(taskName.trim());
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
        );
      },
    );
  }
}
