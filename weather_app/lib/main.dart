import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';

import 'View/No_Result_Screen.dart';
import 'View/Result_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return WeatherProvider();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context)
                    .weatherModul
                    ?.getThemeColor() ==
                null
            ? Colors.deepPurple
            : Provider.of<WeatherProvider>(context)
                .weatherModul!
                .getThemeColor(),
      ),
      home: Provider.of<WeatherProvider>(context).weatherModul== null ? NoResultScreen():ResultScreen()
    );
  }
}
