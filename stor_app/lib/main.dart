

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stor_app/View/Home_Screen.dart';
import 'package:stor_app/View/Update_Product_Screen.dart';

import 'Provider/Modul_Hud.dart';

void main() {
  runApp(
      MultiProvider(
        child:const StorApp(),
          providers: [
            ChangeNotifierProvider(create: (context) => ModulHudProvider()),
          ],
       )
  );
}

class StorApp extends StatelessWidget {
  const StorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute:HomeScreen.id,
      routes: {
         HomeScreen.id :(context)=>HomeScreen(),
        UpdateProductScreen.id:(context) =>UpdateProductScreen(),
      },
    );
  }
}
