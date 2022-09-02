


import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chat_app/View/Login_Screen.dart';
import 'package:chat_app/View/Splash_Screen_Body.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String id ='SplashScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body:SplashScreenBody()
    );
  }
}
