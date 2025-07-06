import 'package:to_do_app/components/common/add_task_button.dart';
import 'package:to_do_app/models/model.dart';
import 'package:to_do_app/widgets/live_tasks_list.dart';
import 'package:to_do_app/widgets/complete_tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/components/common/divider_widget.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final Model model = Model();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff243545),
          title: Text(
            "Tasks",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
        ),
      
        body: CustomScrollView(
          slivers: [
            BodyWidget(),
            SliverToBoxAdapter(child: DividerWidget()),
            CompleteTasks(),
          ],
        ),
        
        floatingActionButton: AddTask(),
      ),
    );
  }
}
