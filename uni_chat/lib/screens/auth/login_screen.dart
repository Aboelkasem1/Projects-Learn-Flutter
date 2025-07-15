import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/models/messageRegister.dart';
import 'package:uni_chat/models/user_model.dart';
import 'package:uni_chat/screens/auth/componante/login_button.dart';
import 'package:uni_chat/screens/auth/componante/text_field_input.dart';
import 'package:uni_chat/screens/auth/componante/user_have_account_or_not.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String ID = 'LoginScreen';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Messageregister>(
      builder: (context, messageRegister, child) {
        if (messageRegister.message != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  messageRegister.message!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
            messageRegister.clear();
          });
        }

        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(), // Close keyboard
            child: Container(
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: Column(
                children: [
                  // Logo
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset(
                        'assets/logo/uni_logo.png',
                        width: 200,
                      ),
                    ),
                  ),
                  // Form Section
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Spacer(flex: 2),
                          const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          // Email
                          TextFieldInput(
                            obscureText: false,
                            controller: emailController,
                            hint: 'Email',
                          ),
                          const SizedBox(height: 15),
                          // Password
                          TextFieldInput(
                            controller: passwordController,
                            hint: 'Password',
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          // Login Button
                          Consumer<UserModelList>(
                            builder: (context, userModelList, child) => LoginButton(
                              emailController: emailController,
                              passwordController: passwordController,
                              userModelList: userModelList,
                            ),
                          ),

                          const SizedBox(height: 10),
                          // Register Link
                          UserHaveAccountOrNot(nextPage: 'Sign Up'),
                          const Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
