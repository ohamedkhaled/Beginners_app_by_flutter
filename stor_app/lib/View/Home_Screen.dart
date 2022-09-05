
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stor_app/Custom_Widget/PresentProduct_Widget.dart';

import '../Moduls/Product_Modul.dart';
import '../Servisec/Get_Products.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.arrow_back, color: Colors.black,),
                      Text('New Trend', style: TextStyle(fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),),
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.black,),
                        onPressed: () {},)
                    ]),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
          child: FutureBuilder<List<ProductModul>>(
              future: GetProducts().getProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModul>? ListProducts= snapshot.data;
                  return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1
                    ),
                    itemBuilder: (context, index) {
                      return PresetProduct(productModul: ListProducts![index]);
                    },
                    itemCount: 10,);
                } else {
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
              }
          ),

        )

    );
  }
}

