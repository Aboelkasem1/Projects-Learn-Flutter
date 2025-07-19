import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/core/themes/app_theme.dart';
import 'package:uni_chat/models/mode_model.dart';
import 'package:uni_chat/screens/admins/users/users_admin_controle_screen.dart';
import 'package:uni_chat/screens/auth/signin/sginin_screen.dart';
import 'package:uni_chat/screens/auth/signup/signup_screen.dart';
import 'package:uni_chat/screens/home/home_screen.dart';
import 'package:uni_chat/screens/splash/splash_screen.dart';

class UniChat extends StatefulWidget {
  const UniChat({super.key});

  @override
  State<UniChat> createState() => _UniChatState();
}

class _UniChatState extends State<UniChat> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModeModel>(
      builder: (context, modeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UniChat',
          routes: {
            SplashScreen.ID: (context) => SplashScreen(),
            LoginScreen.ID: (context) => LoginScreen(),
            RegisterScreen.ID: (context) => RegisterScreen(),
            HomeScreen.ID: (context) => HomeScreen(),
            UsersAdminControlScreen.ID: (context) => UsersAdminControlScreen(),
          },
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: modeModel.mode == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: SplashScreen.ID,
        );
      },
    );
  }
}
