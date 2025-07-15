import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/models/messageRegister.dart';
import 'package:uni_chat/models/user_model.dart';
import 'package:uni_chat/screens/auth/login_screen.dart';
import 'package:uni_chat/screens/auth/register_screen.dart';
import 'package:uni_chat/screens/home/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => UserModelList()),
        ChangeNotifierProvider(create: (context) => Messageregister()),
      ],
      child: UniChat(),
    ),
  );
}

class UniChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniChat',
      routes: {
        LoginScreen.ID: (context) => LoginScreen(),
        RegisterScreen.ID: (context) => RegisterScreen(),
        HomeScreen.ID: (context) => HomeScreen(),
      },
      initialRoute: LoginScreen.ID,
    );
  }
}
