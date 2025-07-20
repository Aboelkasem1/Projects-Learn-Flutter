import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/build/build_pages.dart';
import 'package:uni_chat/core/themes/app_theme.dart';
import 'package:uni_chat/models/mode_model.dart';
import 'package:uni_chat/build/admin_widgets/screens/users_admin_controle_screen.dart';
import 'package:uni_chat/screens/admins/admin_screen.dart';
import 'package:uni_chat/screens/auth/login_screen.dart';
import 'package:uni_chat/screens/auth/register_screen.dart';
import 'package:uni_chat/screens/chat/chat_screen.dart';
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
            SplashScreen.id: (context) => SplashScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            RegisterScreen.id: (context) => RegisterScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            BuildPages.id: (context) => BuildPages(),
            ChatScreen.id: (context) => ChatScreen(group: {}),
            AdminScreen.id: (context) => AdminScreen(),
            UsersAdminControlScreen.id: (context) => UsersAdminControlScreen(),
          },
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: modeModel.mode == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: SplashScreen.id,
        );
      },
    );
  }
}
