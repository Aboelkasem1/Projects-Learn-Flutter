import 'package:app_to_testing/widgets/body_widget.dart';
import 'package:app_to_testing/widgets/complate_tasks.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff243545),
        title: Text(
          "Taskes",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),

      body: CustomScrollView(
          slivers: [
            BodyWidget(),
            SliverToBoxAdapter(
              child: Divider(
                color: Colors.black,
                thickness: 2,
                height: 1,
                indent: 10,
                endIndent: 10,
              ),
            ),
            ComplateTaskes(),

          ],
        ),
      

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff243545),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}

