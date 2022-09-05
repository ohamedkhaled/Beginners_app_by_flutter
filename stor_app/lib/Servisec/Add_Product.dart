import 'package:stor_app/Helper/api.dart';
import 'package:stor_app/Moduls/Product_Modul.dart';

class AddProduct {
  Future<ProductModul> addProduct(
      {required title,
      required price,
      required description,
      required image,
      required category}) async {
    Map<String, dynamic> data =
        await Api().Post(Url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModul.fromJson(data);
  }
}
