import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Controler/Weather_Services.dart';
import 'package:weather_app/Model/Weather_Model.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/main.dart';

class SearchPage extends StatelessWidget
{
  String? CityName ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onChanged: (value){
              CityName=value;
            },
            onSubmitted: (value) async {
              ActionSearch(context);
             // CityName=value;
            },
            decoration: InputDecoration(
              contentPadding:EdgeInsets.symmetric(vertical: 25,horizontal: 25 ) ,
              suffixIcon: IconButton(  icon: Icon(Icons.search) , onPressed: (){
                ActionSearch(context);
              },),
              border: OutlineInputBorder(),
              hintText: 'Enter City\'s name '
            ),
          ),
        ) ,
      ),
    );
  }

ActionSearch(context) async {
  WeatherServices services=WeatherServices();
  WeatherModul? weatherData= await services.getWeather(CityName: CityName) ;
  Provider.of<WeatherProvider>(context,listen: false).weatherModul=weatherData;
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return MyApp();
  }));
}

}