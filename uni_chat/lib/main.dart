import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/app/uni_chat.dart';
import 'package:uni_chat/models/messageRegister.dart';
import 'package:uni_chat/models/mode_model.dart';
import 'package:uni_chat/models/selected_Index.dart';
import 'package:uni_chat/models/user_model.dart';
import 'package:uni_chat/screens/chat/reply_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => Messageregister()),
        ChangeNotifierProvider(create: (context) => ModeModel()),
        ChangeNotifierProvider(create: (context) => SelectedIndex()),
        ChangeNotifierProvider<ReplyProvider>(
          create: (context) => ReplyProvider(),
        ),
      ],
      child: UniChat(),
    ),
  );
}
