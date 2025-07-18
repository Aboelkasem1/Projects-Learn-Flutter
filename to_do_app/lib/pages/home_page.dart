import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/common/add_task_button.dart';
import 'package:to_do_app/models/model.dart';
import 'package:to_do_app/widgets/live_tasks_list.dart';
import 'package:to_do_app/widgets/complete_tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/components/common/divider_widget.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final confettiController = ConfettiController();
  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
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

          Consumer<Model>(
            builder: (context, model, child) {
              final isCompleted = model.activeTasks.isEmpty;

              if (isCompleted) {
                log('🎉 All tasks completed!');
                confettiController.play();
              } else {
                log(
                  '🕓 Not completed — Active: ${model.activeTasks.length}, allCompleted: ${model.allCompleted}',
                );
                confettiController.stop();
              }

              return Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  emissionFrequency: 0.3,
                  shouldLoop: false,
                  gravity: 0.00,
                  particleDrag: 0.01,
                  colors: [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.yellow,
                    Colors.orange,
                  ],
                ),
              );
            },
          ),

          Consumer<Model>(
            builder: (context, model, child) {
              final isCompleted = model.activeTasks.isEmpty;

              return isCompleted
                  ? Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 50,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withAlpha(200),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 15,
                              blurRadius: 30,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          'All tasks completed!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
