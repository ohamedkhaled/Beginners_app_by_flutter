import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stor_app/Helper/api.dart';
import 'package:stor_app/Moduls/Product_Modul.dart';

class GetCategoryName {
  Future<List<ProductModul>> getCategoryName(String CategoryName) async {
    List<dynamic> jsonData = await Api()
        .Get(Url:'https://fakestoreapi.com/products/category/$CategoryName');

    List<ProductModul> productModul = [];

    for (int i = 0; i < jsonData.length; i++) {
      productModul.add(ProductModul.fromJson(jsonData[i]));
    }
    return productModul;
  }
}
