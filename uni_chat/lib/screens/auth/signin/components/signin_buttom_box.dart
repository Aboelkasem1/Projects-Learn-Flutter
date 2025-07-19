import 'dart:developer';
import 'package:uni_chat/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_chat/screens/admins/admin_screen.dart';
import 'package:uni_chat/widgets/build_pages.dart';

class ButtomBox extends StatelessWidget {
  const ButtomBox({
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
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email.text.trim(),
              password: password.text.trim(),
            );

            final User? user = FirebaseAuth.instance.currentUser;
            await user?.reload();
            final updatedUser = user ?? FirebaseAuth.instance.currentUser;
            hideLoadingDialog(context);
            if (email.text.trim() == 'admin@admin.com') {
              log('Admin Login');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AdminScreen()),
              );
            } else if (updatedUser != null && updatedUser.emailVerified) {
              log('User Login: ${updatedUser.email}');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BuildPages()),
              );
            } else {
              log('User not verified: ${updatedUser?.email}');
              showSnackBar(context, 'Please verify your email address first.');
            }
          } on FirebaseAuthException catch (e) {
            hideLoadingDialog(context);
            String message;
            switch (e.code) {
              case 'user-not-found':
                message = 'No user found with this email.';
                break;
              case 'wrong-password':
                message = 'Incorrect password. Please try again.';
                break;
              case 'invalid-credential':
                message = 'Invalid email or password.';
                break;
              default:
                message = 'Authentication error: ${e.code}';
            }
            log(message);
            showSnackBar(context, message);
          } catch (e) {
            hideLoadingDialog(context);
            final error = 'Something went wrong. Please try again.';
            log('General Error: ${e.toString()}');
            showSnackBar(context, error);
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
          'Sign In',
          style: GoogleFonts.inter(
            color: isDark ? Colors.black : Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
