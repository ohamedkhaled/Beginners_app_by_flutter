import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth {
  var auth = FirebaseAuth.instance;

  Future<UserCredential?> SignUp(String Email, String Password) async {
    UserCredential? credential = await auth.createUserWithEmailAndPassword(
      email: Email,
      password: Password,
    );

    return credential;
  }

  Future<UserCredential?> SignIn(String Email, String Password) async {
    UserCredential? credential;
    credential =
        await auth.signInWithEmailAndPassword(email: Email, password: Password);

    return credential;
  }

     void showSnakBar(BuildContext context ,String Message ){

       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Message)));

    }
}
