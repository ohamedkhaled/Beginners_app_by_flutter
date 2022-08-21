import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget
{
  late String Name  ;
  late Color color ;
  Function()? OnTap ;
  CategoryWidget({ required this.color,required this.Name,this.OnTap} );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        padding: EdgeInsets.fromLTRB( 10, 20, 0, 20),
        height:60 ,
        width: double.infinity,
        color: color,
        child: Text('$Name',style: TextStyle( fontSize: 16 , color: Colors.white),),
      ),
    );
  }

}