import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:stor_app/Moduls/Product_Modul.dart';

import '../Custom_Widget/Custom_TextField.dart';
import '../Provider/Modul_Hud.dart';
import '../Servisec/Update_Product.dart';

class UpdateProductScreen extends StatelessWidget {
  static String id = 'UpdateProduct';
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? name;
  String? price;
  String? description;
  String? image;
  @override
  Widget build(BuildContext context) {
    ProductModul productModul = ModalRoute.of(context)!
        .settings
        .arguments as ProductModul;

    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModulHudProvider>(context).isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('UpdateProduct'),
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: globalKey,
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 7,
                    ),
                    CustomTextField(
                      onClick: (value) {
                        name = value!;
                      },
                      hint: 'Product Name',
                      icon: Icons.drive_file_rename_outline,
                      textInputType: TextInputType.name,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    CustomTextField(
                      onClick: (value) {
                        price = value!;
                      },
                      hint: 'Product Price',
                      icon: Icons.monetization_on,
                      textInputType: TextInputType.number,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    CustomTextField(
                      onClick: (value) {
                        description = value!;
                        print('description is $description');
                      },
                      hint: 'Product Discription',
                      icon: Icons.description,
                      textInputType: TextInputType.text,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    CustomTextField(
                      onClick: (value) {
                        image = value!;
                      },
                      hint: 'Product Image',
                      icon: Icons.image,
                      textInputType: TextInputType.text,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.grey,
                            shadowColor: Colors.grey,
                            elevation: 10),
                        onPressed: () async{
                          print('moooo');
                          Provider.of<ModulHudProvider>(context,listen: false).ChangeHud(true);
                          await Validate(productModul);
                          try{
                            print('moooo2');

                        Provider.of<ModulHudProvider>(context,listen: false).ChangeHud(false) ;
                        print("susccefuly");
                          }catch(e){
                            print(e.toString());
                          }
                          Provider.of<ModulHudProvider>(context,listen: false).ChangeHud(false) ;
                        },
                        child: Text('Update')),
                    const Spacer(flex: 7),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 Future<void> Validate(ProductModul productModul) async{
     print('moooo3');
    if (globalKey.currentState!.validate()) {
      print('moooo4');
      globalKey.currentState!.save();
      print(productModul.price);
      await UpdateProduct().upDateProduc(
          title: name=='' ? productModul.title:name!,
          price: price==''?productModul.price:price,
          description:description==''?productModul.description:description,
          image:  image==''?productModul.image:image,
          category: productModul.category,
          id:productModul.id
       );


    }
  }
}
