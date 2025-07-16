import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/models/user_model.dart';
import 'package:uni_chat/screens/account/account_screen.dart';

class ImageBar extends StatelessWidget {
  const ImageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AccountScreen()),
          );
        },
        child: Consumer<UserModel>(
          builder: (context, userModel, child) => CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: userModel.imageUrl == null
                ? const Icon(Icons.person, color: Colors.black)
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.greenAccent, width: 5),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        userModel.imageUrl!,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
