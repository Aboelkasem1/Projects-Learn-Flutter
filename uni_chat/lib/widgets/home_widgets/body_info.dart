import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_chat/screens/chat/chat_screen.dart';
import 'package:uni_chat/widgets/home_widgets/image_bar.dart';

class BodyInfo extends StatelessWidget {
  const BodyInfo({super.key, required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ChatScreen(user: user, chatId: user?.uid ?? 'default_chat'),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : Colors.grey[200],
            border: Border.symmetric(
              horizontal: BorderSide(
                color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              ),
            ),
          ),
          child: ListTile(
            leading: SizedBox(width: 70, child: ImageBar()),
            title: Text(
              '${user?.displayName ?? user?.email ?? 'Guest'}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Hello, I am user $index'),
          ),
        ),
      ),
    );
  }
}
