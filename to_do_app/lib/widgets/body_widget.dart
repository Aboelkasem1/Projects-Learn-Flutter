import 'package:to_do_app/components/checked.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/complate_tasks.dart';
import 'package:to_do_app/widgets/text_tasks.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  void updateTask(int index, bool newValue) {
    setState(() {
      final task = tasks[index];
      tasks[index] = TaskModel(name: task.name, state: newValue);
      if (newValue) {
        completeTasks.add(TaskModel(name: task.name, state: newValue));
        tasks.removeAt(index);
        
      } else {
        completeTasks.removeWhere((t) => t.name == task.name);
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
            onScaleStart: (details) {
              setState(() {
                tasks[index].state = true;
              });
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: tasks[index].state!
                    ? Colors.blueGrey
                    : const Color(0xff243545),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Checked(
                      state: tasks[index].state!,
                      onChanged: (bool newValue) {
                        updateTask(index, newValue);
                      },
                    ),
                  ),
                  TextTaskes(
                    name: tasks[index].name,
                    state: tasks[index].state!,
                  ),
                ],
              ),
            ),
          ),
        );
      },
        childCount: tasks.length),
    );
  }
}
