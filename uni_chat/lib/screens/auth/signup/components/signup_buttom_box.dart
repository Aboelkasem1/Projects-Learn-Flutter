import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_chat/consts/consts.dart';

class SignUpButtonBox extends StatelessWidget {
  const SignUpButtonBox({
    super.key,
    required this.email,
    required this.password,
    required this.formKey,
  });

  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          showLoadingDialog(context);
          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email.text.trim(),
              password: password.text.trim(),
            );

            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();

            if (context.mounted) {
              hideLoadingDialog(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'The activation link has been sent to your email.',
                  ),
                  backgroundColor: Colors.green,
                ),
              );
              hideLoadingDialog(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You must confirm the first email 📧')),
              );
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'email-already-in-use') {
              log('The email is already in use.');
              showSnackBar(context, 'The email is already in use.');
            } else if (e.code == 'invalid-email') {
              log('The email address is not valid.');
              showSnackBar(context, 'The email address is not valid.');
            } else if (e.code == 'weak-password') {
              log('The password provided is too weak.');
              showSnackBar(context, 'The password provided is too weak.');
            } else {
              log('error: ${e.code}');
              showSnackBar(context, 'error: ${e.code}');
            }
          } catch (e) {
            log('General Error: ${e.toString()}');
            showSnackBar(context, 'Error: ${e.toString()}');
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isDark ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.inter(
            color: isDark ? Colors.black : Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
