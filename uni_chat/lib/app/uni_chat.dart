import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/core/themes/app_theme.dart';
import 'package:uni_chat/models/mode_model.dart';
import 'package:uni_chat/screens/auth/login_screen.dart';
import 'package:uni_chat/screens/auth/register_screen.dart';
import 'package:uni_chat/screens/splash/splash_screen.dart';
class UniChat extends StatelessWidget {
  const UniChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ModeModel>(
      builder: (context, modeModel, child) {
        return MaterialApp(
          // showPerformanceOverlay: true,
          debugShowCheckedModeBanner: false,
          title: 'UniChat',
          routes: {
            SplashScreen.ID: (context) => SplashScreen(),
            LoginScreen.ID: (context) => LoginScreen(),
            RegisterScreen.ID: (context) => RegisterScreen(),
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
