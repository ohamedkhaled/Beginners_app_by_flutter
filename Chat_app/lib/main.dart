import 'package:chat_app/Provider/Model_Hud_Provider.dart';
import 'package:chat_app/View/Chat_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/Login_Screen.dart';
import 'View/SignUp_Screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
  MultiProvider(
   child: ChatApp(),
      providers: [
        ChangeNotifierProvider(create: (context) => ModelHud()),
  ]
  ));
}

class ChatApp extends StatelessWidget {
  const ChatApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id:(context)=> LoginScreen(),
        SignUpScreen.id:(context)=> SignUpScreen(),
        ChatScreen.id:(context)=> ChatScreen(),
      },

     // home: LoginScreen(),
    );
  }
}

