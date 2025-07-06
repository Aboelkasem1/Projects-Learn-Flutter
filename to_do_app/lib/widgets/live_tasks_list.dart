import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/tasks/live_task_item.dart';
import 'package:to_do_app/models/model.dart';

class BodyWidget extends StatelessWidget {
  BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final task = model.activeTasks[index];

        return ItemWidget(index: index, model: model, task: task);
      }, childCount: (model.activeTasks.length)),
    );
  }
}
