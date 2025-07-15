import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/models/messageRegister.dart';
import 'package:uni_chat/screens/auth/componante/user_have_account_or_not.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String ID = 'RegisterScreen';

  // Controllers
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            children: [
              _buildTextField(
                onChanged: (data) {
                  email = data;
                },
                hint: 'Email',
              ),
              const SizedBox(height: 15),
              _buildTextField(
                onChanged: (data) {
                  password = data;
                },
                hint: 'Password',
                obscure: true,
              ),
              const SizedBox(height: 25),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    if (email != null && password != null) {
                      try {
                        await RegisterUser(context);
                      } on FirebaseAuthException catch (e) {
                        FirebaseExceptionHandle(e, context);
                      } catch (e) {
                        _showSnackBar(context, 'Please fill in all fields');
                      }
                    } else {
                      _showSnackBar(context, 'Please fill in all fields');
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
                    'Register',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              UserHaveAccountOrNot(nextPage: 'Login'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> RegisterUser(BuildContext context) async {
    // ignore: unused_local_variable
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    Navigator.pop(context);
    Provider.of<Messageregister>(
      context,
      listen: false,
    ).setMessage('User Created Success');
    log('User Created $email == $password');
  }

  Widget _buildTextField({
    required Function(String) onChanged,
    required String hint,
    bool obscure = false,
  }) {
    return TextField(
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
      ),
    );
  }
}







void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(message)));
}

void FirebaseExceptionHandle(FirebaseAuthException e, BuildContext context) {
  if (e.code == 'weak-password') {
    _showSnackBar(context, 'The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    _showSnackBar(context, 'The account already exists for that email.');
  }
}
