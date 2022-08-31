import 'package:chat_app/View/SignUp_Screen.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget
{
  final String child ;
  VoidCallback? OnClick ;
  CustomButton({required this.child,this.OnClick});
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: OnClick,
        child: Text(child ,style:TextStyle(fontSize: 15) ,),
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.grey,
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey)
            )
        )
    );
  }

}