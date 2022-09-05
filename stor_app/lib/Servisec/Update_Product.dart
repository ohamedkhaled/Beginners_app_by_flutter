import 'package:flutter/cupertino.dart';
import 'package:stor_app/Helper/api.dart';
import 'package:stor_app/Moduls/Product_Modul.dart';
class UpdateProduct
  {

    Future<ProductModul> upDateProduc (
         { required title,
           required price,
           required description,
           required image,
           required category,
         required id
         }
         ) async{
         print('moooo5');
          Map<String,dynamic> Data =await Api().Put(Url:'https://fakestoreapi.com/products/$id',body: {
         'title': title,
         'price': price.toString(),
         'description': description,
         'image': image,
         'category': category,
       });

          return ProductModul.fromJson(Data);
     }
  }