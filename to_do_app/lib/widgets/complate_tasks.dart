import 'package:app_to_testing/components/checked.dart';
import 'package:app_to_testing/main.dart';
import 'package:app_to_testing/widgets/text_tasks.dart';
import 'package:flutter/material.dart';

class ComplateTaskes extends StatefulWidget {
  ComplateTaskes({super.key});
  @override
  State<ComplateTaskes> createState() => _ComplateTaskesState();
}

class _ComplateTaskesState extends State<ComplateTaskes> {
  updateTask(int index, bool newValue) {
    if (newValue) {
      completeTasks[index].state = true;
    }
    else {
      completeTasks[index].state = false;
    }
    setState(() {
      tasks.add(completeTasks[index]);
      completeTasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: completeTasks.length,
      itemBuilder: (context, index) {
        return Padding(
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
                    state: completeTasks[index].state!,
                    onChanged: (bool newValue) {
                      setState(() {
                        updateTask(index, newValue);
                      });
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
        );
      },
    );
  }
}
