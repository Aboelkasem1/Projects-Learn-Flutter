import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/models/messageRegister.dart';
import 'package:uni_chat/models/user_model.dart';
import 'package:uni_chat/screens/auth/componante/user_have_account_or_not.dart';
import 'package:uni_chat/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String ID = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isLoading = false;

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
                  style: const TextStyle(
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
          body: Form(
            key: _formKey,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                decoration: BoxDecoration(color: Colors.blue[100]),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Image.asset(
                          'assets/logo/uni_logo.png',
                          width: 200,
                        ),
                      ),
                    ),
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
                            MyTextFormField(
                              hint: 'Email',
                              obscure: false,
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                            const SizedBox(height: 15),
                            // Password
                            MyTextFormField(
                              hint: 'Password',
                              obscure: true,
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            // Login Button
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (email != null &&
                                        password != null &&
                                        email!.isNotEmpty &&
                                        password!.isNotEmpty) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await loginUser(context);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      _showSnackBar(
                                        context,
                                        'Please fill all fields',
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
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
          ),
        );
      },
    );
  }

  Future<void> loginUser(BuildContext context) async {
    log('Email: $email');
    log('Password: $password');

    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);

      log('Login Successful');

      if (email == 'admin@test.com' && credential.user?.photoURL == null) {
        await credential.user!.updatePhotoURL(
          'https://i.pinimg.com/736x/36/cf/59/36cf596a3c731d37723a0fc8d50e9df0.jpg',
        );

        await credential.user!.reload();
      }

      Provider.of<UserModel>(context, listen: false).user = credential;
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      handleFirebaseError(e, context);
      log(e.code.toString());
    } catch (e) {
      log('Unknown error: $e');
      _showSnackBar(context, 'An unexpected error occurred.');
    }
  }

  void handleFirebaseError(FirebaseAuthException e, BuildContext context) {
    String message;
    switch (e.code) {
      case 'user-not-found':
        message = 'No user found for that email.';
        break;
      case 'wrong-password':
        message = 'Wrong password.';
        break;
      case 'invalid-email':
        message = 'Invalid email format.';
        break;
      case 'too-many-requests':
        message = 'Too many attempts. Try again later.';
        break;
      default:
        message = 'Error: ${e.message}';
    }
    _showSnackBar(context, message);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.obscure = false,
  });

  final String hint;
  final Function(String)? onChanged;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        } else if (hint == 'Email' &&
            (!value.contains('@') || !value.contains('.'))) {
          return 'Please enter a valid email';
        } else if (hint == 'Password' && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      onChanged: onChanged,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
