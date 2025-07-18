import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/components/common/checked.dart';
import 'package:to_do_app/models/model.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/task_text.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(
            onDismissed: () {
              model.deleteTask(task);
            },
            confirmDismiss: () async {
              final result = await showDialog<bool>(
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

              return result ?? false;
            },
          ),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: task.state! ? Colors.blueGrey : const Color(0xff243545),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Checked(
                state: task.state!,
                onChanged: (bool newValue) {
                  model.updateTask(index, newValue);
                },
              ),
              TextTasks(name: task.name, state: task.state!),
            ],
          ),
        ),
      ),
    );
  }
}
