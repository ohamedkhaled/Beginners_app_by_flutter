
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget
{
  final  String Hint;
  Function(String)? OnChange ;

  CustomTextField({required this.Hint,this.OnChange});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return errMassage(Hint);
        }

      },
      onChanged:OnChange,
      cursorColor: Colors.white,
      obscureText: Hint=='Password'? true:false,
      decoration: InputDecoration(
          hintText: Hint,
          hintStyle: TextStyle(
              color: Colors.white
          ),
          focusColor: Colors.white,
          fillColor: kPrimaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            ),
          ) ,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red
            )
        )
      ),
    );
  }

}

String  errMassage(String hint )
{
  switch( hint){
    case 'Email':return 'Email is empty!';
    case 'Password' :return 'Password is empty!';
  }
  return '';
}