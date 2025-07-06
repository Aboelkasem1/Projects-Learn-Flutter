import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/common/checked.dart';
import 'package:to_do_app/models/model.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/task_text.dart';

class items_complete extends StatelessWidget {
  const items_complete({
    super.key,
    required this.index,
    required this.model,
    required this.task,
  });

  final int index;
  final Model model;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.delete, color: Colors.white, size: 32),
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Delete Task"),
              content: Text("Are you sure you want to delete this task?"),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                TextButton(
                  child: Text("Delete"),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            );
          },
        );
      },

      onDismissed: (direction) {
        model.deleteCompleteTask(task);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Checked(
                  state: task.state!,
                  onChanged: (bool newValue) {
                    Provider.of<Model>(
                      context,
                      listen: false,
                    ).updateTask(index, newValue);
                  },
                ),
              ),
              TextTasks(name: task.name, state: task.state!),
            ],
          ),
        ),
      ),
    );
  }
}
