
import 'package:chat_app/Provider/Model_Hud_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../custom_widget/Costum_TextField.dart';
import '../custom_widget/Custom_button.dart';
import '../services/auth_services.dart';
import 'Chat_Screen.dart';

class SignUpScreen extends StatelessWidget
{
  GlobalKey<FormState> formKey =GlobalKey();
  static String  id = 'SignUpScreen';
  String? Email , Password ;
  Auth auth =Auth();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).IsLoading ,
      child: Scaffold(
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
                child: Text('Sign Up',style: TextStyle(
                    fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomTextField(Hint: 'Email',OnChange:(value){Email=value; } ,),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomTextField(Hint: 'Password',OnChange:(value){Password=value; } ),
              ),
              SizedBox(height: 30,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(child: 'Sign Up',OnClick:() async {
                   if(formKey.currentState!.validate()) {
                     try {
                       Provider.of<ModelHud>(context, listen: false)
                           .ChangeIsLoading(true);
                       UserCredential? result = await auth.SignUp(
                           Email!.trim(), Password!.trim());
                       Provider.of<ModelHud>(context, listen: false)
                           .ChangeIsLoading(false);
                       Navigator.pushNamed(context, ChatScreen.id,arguments: Email);

                     } on FirebaseAuthException catch (e) {
                       if (e.code == 'weak-password') {
                         Provider.of<ModelHud>(context, listen: false)
                             .ChangeIsLoading(false);
                         auth.showSnakBar(
                             context, 'The password provided is too weak.');

                       } else if (e.code == 'email-already-in-use') {
                         Provider.of<ModelHud>(context, listen: false)
                             .ChangeIsLoading(false);
                         auth.showSnakBar(context,
                             'The account already exists for that email.');

                       }
                     } catch (e) {
                       Provider.of<ModelHud>(context, listen: false)
                           .ChangeIsLoading(false);
                       print("other error");

                     }
                   }else{
                     Provider.of<ModelHud>(context, listen: false)
                         .ChangeIsLoading(false);

                   }
                   Provider.of<ModelHud>(context, listen: false)
                       .ChangeIsLoading(false);
                   auth.showSnakBar(
                       context, 'there is error!');

                  } ,)
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text('Do\'nt have an account?',style: TextStyle(color: Colors.white), ),
                  TextButton(
                      onPressed: () {Navigator.pop(context);  },
                      child: Text('Sign In'),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal:0,vertical: 0)
                      )

                  )
                ], ),


            ],
          ),
        ),
      ),
    );
  }


}