import 'package:chat_app/View/Chat_Screen.dart';
import 'package:chat_app/custom_widget/Costum_TextField.dart';
import 'package:chat_app/custom_widget/Custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Model_Hud_Provider.dart';
import '../constants.dart';
import '../services/auth_services.dart';
import 'SignUp_Screen.dart';

class LoginScreen extends StatelessWidget {
   static String  id = 'LoginScreen';
   String? Email,Password;
   Auth auth =Auth();
   GlobalKey<FormState> formKey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/scholar.png')),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:60),
              child: Center(
                  child: Text(
                'Scholar Chat',
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontFamily:'Pacifico'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Sign In',style: TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomTextField(Hint: 'Email', OnChange: (value){
                print(value);
                Email=value;
              },),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomTextField(Hint: 'Password',OnChange: (value){
                Password=value;

              },),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(child: 'Sign In',OnClick: () async {

                if(formKey.currentState!.validate()){
                try {
                  Provider.of<ModelHud>(context, listen: false)
                      .ChangeIsLoading(true);
                  UserCredential? result = await auth.SignIn(Email!.trim(), Password!.trim());
                  Provider.of<ModelHud>(context, listen: false)
                      .ChangeIsLoading(false);
                  auth.showSnakBar(context, 'Success');
                  Navigator.pushNamed(context, ChatScreen.id,arguments: Email);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    Provider.of<ModelHud>(context, listen: false)
                        .ChangeIsLoading(false);
                    auth.showSnakBar(context, 'No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    Provider.of<ModelHud>(context, listen: false)
                        .ChangeIsLoading(false);
                    auth.showSnakBar(context, 'Wrong password provided for that user.');
                  }
                }
              } else{

              }
                Provider.of<ModelHud>(context, listen: false)
                    .ChangeIsLoading(false);
                }
                ,)
                ),

           Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[

               Text('Do\'nt have an account?',style: TextStyle(color: Colors.white), ),
               TextButton(
                 onPressed: () {
                   Navigator.pushNamed(context, SignUpScreen.id);
                 },
                 child: Text('Sign Up'),
                 style: TextButton.styleFrom(
                   primary: Colors.white,
                   padding: EdgeInsets.symmetric(horizontal:0,vertical: 0)
                 )

               )
             ], ),


          ],
        ),
      ),
    );
  }
}
