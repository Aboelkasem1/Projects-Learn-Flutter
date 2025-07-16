import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/models/mode_model.dart';
import 'package:uni_chat/widgets/home_widgets/body_info.dart';
import 'package:uni_chat/widgets/home_widgets/image_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        leading: const ImageBar(),
        leadingWidth: 70,
        shadowColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
            Colors.grey,
        title: const Text(
          'UniChat',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          const Icon(Icons.add, size: 40),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Provider.of<ModeModel>(context, listen: false).toggleMode();
            },
            child: Icon(isDark ? Icons.light_mode : Icons.dark_mode, size: 35,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: BodyInfo(user: user),
    );
  }
}
