
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stor_app/Moduls/Product_Modul.dart';
import 'package:stor_app/View/Update_Product_Screen.dart';

class PresetProduct extends StatelessWidget
{

  ProductModul productModul;
  PresetProduct( {required this.productModul});

  @override
  Widget build(BuildContext context) {

   return  GestureDetector(
     onTap: (){
       Navigator.pushNamed(context, UpdateProductScreen.id,arguments:productModul);
     },
     child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 140,
              width: 180,
              decoration: BoxDecoration(
                boxShadow: [ BoxShadow(
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0,
                  offset: Offset(10,10)
                )
              ]),
              child: Card(
                        elevation: 10,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('${productModul.description!.substring(0,15)}...',style: TextStyle(color: Colors.grey,fontSize: 15),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(r'$''${productModul.price}',style: TextStyle(fontSize: 13),),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite ))
                                ],
                              )
                            ],
                          ),
                        ),
              ),
            ),
            Positioned(
              right: 15,
              top: -25,
             child:Image.network('${productModul.image}',height: 85,)
            ),

          ],
      ),
   );

  }

}