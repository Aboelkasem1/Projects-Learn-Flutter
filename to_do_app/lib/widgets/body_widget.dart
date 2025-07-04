import 'package:app_to_testing/components/checked.dart';
import 'package:app_to_testing/main.dart';
import 'package:app_to_testing/models/task_model.dart';
import 'package:app_to_testing/widgets/text_tasks.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  void updateTask(int index, bool newValue) {
    setState(() {
      tasks[index] = TaskModel(name: tasks[index].name, state: newValue);
      if (newValue) {
        completeTasks.add(TaskModel(name: tasks[index].name, state: newValue));
        tasks.removeAt(index);
      } else {
        completeTasks.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                TextTaskes(name: tasks[index].name, state: tasks[index].state!,),
              ],
            ),
          ),
        );
      },
    );
  }
}
