import 'package:flutter/material.dart';
import 'package:uni_chat/models/user_model.dart';
import 'package:uni_chat/screens/chat/chat_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.userModelList,
    required this.emailController,
    required this.passwordController,
  });

  final UserModelList userModelList;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () async {
          final email = emailController.text.trim();
          final password = passwordController.text;

          if (email.isEmpty || password.isEmpty) {
            _showSnackBar(context, 'Please fill in all fields');
            return;
          } else {
            if (email.contains('@') && email.contains('.com') && password.length > 6) {
              for (var user in userModelList.users) {
                if (user.email == email && user.password == password) {
                  Navigator.pushNamed(context, ChatScreen.ID, arguments: user);
                  return;
                }
              }
              _showSnackBar(context, 'No user found');
            }
            else{
              _showSnackBar(context, 'Please enter a valid email and password');
            }
          }
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(message, style: TextStyle(color: Colors.white)),
    ),
  );
}
