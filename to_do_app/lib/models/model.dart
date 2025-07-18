import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';

class Model extends ChangeNotifier {
  List<TaskModel> activeTasks = [
    TaskModel(name: "Complete Flutter tutorial", state: false),
    TaskModel(name: "Buy groceries", state: false),
    TaskModel(name: "Prepare presentation", state: false),
  ];

  List<TaskModel> completedTasks = [];


  bool get allCompleted => activeTasks.isEmpty;

  List<TaskModel> get upActiveTasks => activeTasks;
  List<TaskModel> get downCompletedTasks => completedTasks;

  void addTask(String name) {
    activeTasks.add(TaskModel(name: name, state: false));
    notifyListeners();
  }

  void completeTask(TaskModel task) {
    task.state = true;
    activeTasks.remove(task);
    completedTasks.add(task);
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    activeTasks.remove(task);
    notifyListeners();
  }

  void deleteCompleteTask(TaskModel task) {
    completedTasks.remove(task);
    notifyListeners();
  }

  void updateTask(int index, bool newValue) {
    if (newValue) {
      activeTasks[index].state = true;
      completedTasks.add(activeTasks[index]);
      activeTasks.removeAt(index);
    } else {
      completedTasks[index].state = false;
      activeTasks.add(completedTasks[index]);
      completedTasks.removeAt(index);
    }
    notifyListeners();
  }
}
