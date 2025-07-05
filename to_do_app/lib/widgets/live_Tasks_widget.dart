import 'package:provider/provider.dart';
import 'package:to_do_app/components/checked.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/widgets/complate_tasks.dart';
import 'package:to_do_app/widgets/text_tasks.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(
      context,
    ); // بـ listen = true لأنك عايز تتبع التغييرات

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final task = model.tasks[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: task.state! ? Colors.blueGrey : const Color(0xff243545),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Checked(
                    state: task.state!,
                    onChanged: (bool newValue) {
                      model.updateTask(
                        index,
                        newValue,
                      ); // مش محتاج تعمل Provider.of تاني هنا
                    },
                  ),
                ),
                TextTaskes(name: task.name, state: task.state!),
              ],
            ),
          ),
        );
      }, childCount: model.tasks.length),
    );
  }
}
