
import 'package:chat_app/View/Login_Screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SplashScreenBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _SplashScreenBody();
  }
}
class _SplashScreenBody extends State<SplashScreenBody>  with SingleTickerProviderStateMixin{
  AnimationController? animationController;
  Animation<double>? fadingAnimation ;
  @override
  void initState() {
    super.initState();
    animationController =AnimationController(vsync: this,duration: Duration(milliseconds: 600));
    fadingAnimation=Tween<double>(begin: .2,end :1).animate(animationController!);
    animationController?.repeat(reverse: true);
    getToNextView();
  }
  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: kPrimaryColor,
        child: FadeTransition(
           opacity:fadingAnimation!,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/scholar.png')),

                Center(
                    child: Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    )),
              ],
            ),
      ),
    )
    );
  }

  void getToNextView() {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.popAndPushNamed(context, LoginScreen.id);
    });

  }
}
