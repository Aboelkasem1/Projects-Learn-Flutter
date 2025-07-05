import 'package:flutter/material.dart';
import 'package:to_do_app/components/checked.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/widgets/text_tasks.dart';

class CompleteTasks extends StatefulWidget {
  const CompleteTasks({super.key});
  @override
  State<CompleteTasks> createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  void updateTask(int index, bool newValue) {
    completeTasks[index].state = newValue;
    setState(() {
      if (!newValue) {
        tasks.add(completeTasks[index]);
        completeTasks.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Task'),
                    content: const Text(
                      'Are you sure you want to delete this task?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            completeTasks.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
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
                      state: completeTasks[index].state!,
                      onChanged: (bool newValue) {
                        updateTask(index, newValue);
                      },
                    ),
                  ),
                  TextTaskes(
                    name: completeTasks[index].name,
                    state: completeTasks[index].state!,
                  ),
                ],
              ),
            ),
          ),
        );
      },
        childCount: completeTasks.length),
    );
  }
}
