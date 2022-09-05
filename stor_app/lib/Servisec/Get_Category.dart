
import '../Helper/api.dart';

class GetCategory
{


  Future<List<dynamic>> getAllCategory()async {
    return
      await Api().Get( Url: 'https://fakestoreapi.com/products/categories');
  }
}