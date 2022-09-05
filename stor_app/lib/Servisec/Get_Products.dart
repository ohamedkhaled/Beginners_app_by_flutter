
import 'package:stor_app/Moduls/Product_Modul.dart';

import '../Helper/api.dart';

class GetProducts {

  Future<List<ProductModul>> getProduct() async {
    List<dynamic> jasonData= await Api().Get( Url:'https://fakestoreapi.com/products');
    List<ProductModul> productModuls = [];
    for (int i = 0; i < jasonData.length; i++) {
      if(i==4){
        i=i+8;
        continue;
      }
      productModuls.add(ProductModul.fromJson(jasonData[i]));

    }
    return productModuls;
  }
}
