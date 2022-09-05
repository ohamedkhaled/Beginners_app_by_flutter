

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  String? hint ;
  IconData? icon ;
  String?  Function(String?)? onClick;
  TextInputType? textInputType ;


  String _errMesg(String str){
    switch(hint)
    {
      case 'Product Name' :return 'Product Name is empty!';
      case 'Product Price' :return 'Product Price is empty!';
      case 'Product Discription' :return 'Product Discription is empty!';
      case 'Product Category' :return 'Product Category is empty!';
      case 'Product Image' :return 'Product Image is empty!';
    }
    return "";
  }
  CustomTextField({ this.onClick , this.hint,this.icon, this.textInputType});
  CustomTextField.Hint(String Hint,{required this.onClick} ){ hint=Hint; }

  @override
  Widget build(BuildContext context) {

    return Padding( padding: const EdgeInsets.symmetric(horizontal: 25),
        child:TextFormField(
          validator: (value)
          {

          } ,
          keyboardType: textInputType,
          onSaved: onClick,
          obscureText: hint=='Enter your Password'?true :false,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.grey,

            ),
            filled: true,
            fillColor:Colors.grey.withOpacity(.5),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Colors.white
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Colors.white
                )
            ),
            border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Colors.white
                )
            ),

          ),

        )
    );
  }


}