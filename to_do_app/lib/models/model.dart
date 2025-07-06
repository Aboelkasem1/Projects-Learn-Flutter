import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';

class Model extends ChangeNotifier {
  List<TaskModel> activeTasks = [
    TaskModel(name: "Complete Flutter tutorial", state: false),
    TaskModel(name: "Buy groceries", state: false),
    TaskModel(name: "Prepare presentation", state: false),
  ];
  List<TaskModel> completedTasks = [];

  get UpactiveTasks => activeTasks;
  get DowncompletedTasks => completedTasks;

  addTask(String name) {
    activeTasks.add(TaskModel(name: name, state: false));
    notifyListeners();
  }

  completeTask(TaskModel task) {
    task.state = true;
    completedTasks.add(task);
    activeTasks.remove(task);
    notifyListeners();
  }

  deleteTask(TaskModel task) {
    activeTasks.remove(task);
    notifyListeners();
  }

  deleteCompleteTask(TaskModel task) {
    completedTasks.remove(task);
    notifyListeners();
  }

  updateTask(int index, bool newValue) {
    if (newValue) {
      activeTasks[index].state = newValue;
      completedTasks.add(activeTasks[index]);
      activeTasks.removeAt(index);
    } else {
      completedTasks[index].state = newValue;
      activeTasks.add(completedTasks[index]);
      completedTasks.removeAt(index);
    }
    notifyListeners();
  }
}
