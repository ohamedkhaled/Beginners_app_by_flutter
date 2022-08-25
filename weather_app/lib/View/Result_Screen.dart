import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/Weather_Model.dart';
import 'package:weather_app/View/Search_Page.dart';

import '../Providers/Weather_Provider.dart';

class ResultScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    WeatherModul? weatherData = Provider.of<WeatherProvider>(context).weatherModul;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,  MaterialPageRoute(builder: (context){
              return SearchPage();
            } ));
          } , icon: Icon(Icons.search))
        ],
        title: Text('Weather'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
          colors:[ weatherData!.getThemeColor(),
             weatherData!.getThemeColor()[300]!,
            weatherData!.getThemeColor()[100]!
          ],
         begin: Alignment.topCenter,
           end: Alignment.bottomCenter
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                Column(
                  children: [
                    Text( '${weatherData?.CityName}' ,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold) ,),
                    Text('Updated: ${weatherData?.date} PM',style:TextStyle(fontSize: 15)),
                  ],
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset('${weatherData?.getImage()}'),
                  Text('${weatherData?.AvgTemp?.toInt()}',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 25 ),),
                  Column(
                    children: [
                      Text('MaxTemp: ${weatherData?.MaxTemp?.toInt()}'),
                      Text('MinTemp: ${weatherData?.MinTemp?.toInt()}'),
                    ],
                  ),
                ],
              ),
              Text(weatherData?.WeatherState as String,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold))

            ],
          ),
        ),
      ),

    );
  }

}