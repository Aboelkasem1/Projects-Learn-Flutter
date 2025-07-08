import 'dart:ffi';

import 'package:ecommerce_app/common/intro_common/intro_nav_bar.dart';
import 'package:ecommerce_app/common/intro_common/intro_view.dart';
import 'package:ecommerce_app/models/page_number.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    return ChangeNotifierProvider<pageNumber>(
      create: (context) => pageNumber(),
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Consumer<pageNumber>(
                  builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: PageView.builder(
                      dragStartBehavior: DragStartBehavior.start,
                      onPageChanged: (index) {
                        value.change_page(index);
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return IntroView(index: index);
                      },
                      controller: _controller,
                    ),
                  ),
                ),
              ),
              IntroNavBar(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
