import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/tasks/complete_task_item.dart';
import 'package:to_do_app/models/model.dart';

class CompleteTasks extends StatelessWidget {
  const CompleteTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final task = model.completedTasks[index];

        return items_complete(index: index, model: model, task: task);
      }, childCount: model.completedTasks.length),
    );
  }
}
