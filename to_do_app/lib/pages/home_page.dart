import 'package:provider/provider.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/body_widget.dart';
import 'package:to_do_app/widgets/complate_tasks.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final Model model = Model();

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

      body: ChangeNotifierProvider<Model>(
        create: (context) => model,
        child: CustomScrollView(
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
      ),

      floatingActionButton: AddTask(model: model),
    );
  }
}

class AddTask extends StatelessWidget {
  const AddTask({super.key, required this.model});

  final Model model;

  @override
  Widget build(BuildContext context) {
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
  }
}

class Model extends ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(name: "Complete Flutter tutorial", state: false),
    TaskModel(name: "Buy groceries", state: false),
    TaskModel(name: "Prepare presentation", state: false),
    TaskModel(name: "Call mom", state: false),
    TaskModel(name: "Go to the gym", state: false),
    TaskModel(name: "Walk the dog", state: false),
  ];
  List<TaskModel> completeTasks = [];

  addTask(String name) {
    tasks.add(TaskModel(name: name, state: false));
    notifyListeners();
  }

  completeTask(TaskModel task) {
    task.state = true;
    completeTasks.add(task);
    tasks.remove(task);
    notifyListeners();
  }

  deleteTask(TaskModel task) {
    tasks.remove(task);
    notifyListeners();
  }

  deleteCompleteTask(TaskModel task) {
    completeTasks.remove(task);
    notifyListeners();
  }

  updateTask(int index, bool newValue) {
    if (newValue) {
      tasks[index].state = newValue;
      completeTasks.add(tasks[index]);
      tasks.removeAt(index);
    } else {
      completeTasks[index].state = newValue;
      tasks.add(completeTasks[index]);
      completeTasks.removeAt(index);
    }
    notifyListeners();
  }
}
