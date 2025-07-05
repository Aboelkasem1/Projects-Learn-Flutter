import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/checked.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/widgets/text_tasks.dart';

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final task = model.completeTasks[index]; // نوفر الوصول للتاسك

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
                    state: task.state!,
                    onChanged: (bool newValue) {
                      Provider.of<Model>(
                        context,
                        listen: false,
                      ).updateTask(index, newValue);
                    },
                  ),
                ),
                TextTaskes(
                  name: task.name, state: task.state!),
              ],
            ),
          ),
        );
      }, childCount: model.completeTasks.length),
    );
  }
}
