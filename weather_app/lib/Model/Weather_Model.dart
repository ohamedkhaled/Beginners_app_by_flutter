import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherModul {
  final double? MaxTemp, MinTemp, AvgTemp;
  final String? WeatherState, date, Icon ,CityName;

  WeatherModul({this.CityName,
      this.MaxTemp,
      this.MinTemp,
      this.AvgTemp,
      this.WeatherState,
      this.date,
      this.Icon});

  factory WeatherModul.fromJson(dynamic data) {
    var JasonData = data["forecast"]["forecastday"][0]["day"];
    return WeatherModul(
        CityName: data["location"]["name"],
        date: data["location"]["localtime"],
        MaxTemp: JasonData["maxtemp_c"],
        MinTemp: JasonData["mintemp_c"],
        AvgTemp: JasonData["avgtemp_c"],
        WeatherState: JasonData["condition"]["text"],
        Icon: JasonData["condition"]["icon"]);
  }
  String getImage() {
    if (WeatherState == 'Sunny' || WeatherState == 'Clear' ) {
      return 'assets/images/clear.png';
    } else if (

    WeatherState == 'Blizzard' ||  WeatherState == 'Patchy snow possible'  ||  WeatherState == 'Patchy sleet possible' || WeatherState == 'Patchy freezing drizzle possible' || WeatherState == 'Blowing snow'||  WeatherState == 'Partly cloudy') {
      return 'assets/images/snow.png';
    } else if (WeatherState == 'Freezing fog' || WeatherState == 'Fog' ||  WeatherState == 'Heavy Cloud' || WeatherState == 'Mist' || WeatherState == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (WeatherState == 'Patchy rain possible' ||
        WeatherState == 'Heavy Rain' ||
        WeatherState == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (WeatherState == 'Thundery outbreaks possible' || WeatherState == 'Moderate or heavy snow with thunder' || WeatherState == 'Patchy light snow with thunder'|| WeatherState == 'Moderate or heavy rain with thunder' || WeatherState == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor() {
    if (WeatherState == 'Sunny' || WeatherState == 'Clear' ) {
      return Colors.orange;
    } else if (

    WeatherState == 'Blizzard' ||  WeatherState == 'Patchy snow possible'  ||  WeatherState == 'Patchy sleet possible' || WeatherState == 'Patchy freezing drizzle possible' || WeatherState == 'Blowing snow'||  WeatherState == 'Partly cloudy') {
      return Colors.blue;
    } else if (WeatherState == 'Freezing fog' || WeatherState == 'Fog' ||  WeatherState == 'Heavy Cloud' || WeatherState == 'Mist' || WeatherState== 'Fog') {
      return Colors.blueGrey;
    } else if (WeatherState == 'Patchy rain possible' ||
        WeatherState == 'Heavy Rain' ||
        WeatherState == 'Showers	') {
      return Colors.blue;
    } else if (WeatherState == 'Thundery outbreaks possible' || WeatherState == 'Moderate or heavy snow with thunder' || WeatherState== 'Patchy light snow with thunder'|| WeatherState == 'Moderate or heavy rain with thunder' || WeatherState == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }


}
