import 'package:ecommerce_app/models/page_number.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroNavBar extends StatelessWidget {
  const IntroNavBar({super.key, required PageController controller})
    : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<pageNumber>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    _controller.animateToPage(
                      2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                    value.change_page(_controller.page!.toInt());
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            SmoothPageIndicator(controller: _controller, count: 3),

            Consumer<pageNumber>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                    value.change_page(_controller.page!.toInt());
                    if (value.txt == "Done") {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text(
                    value.txt,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
