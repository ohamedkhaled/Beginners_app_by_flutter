import 'package:flutter/cupertino.dart';
import 'package:weather_app/Model/Weather_Model.dart';


class WeatherProvider extends ChangeNotifier  {

  WeatherModul? weatherModul;

  set WeatherData( WeatherModul? weatherData)
  {
    weatherModul=weatherData;
    notifyListeners();
  }

WeatherModul? get WeatherData {
  notifyListeners();
    return weatherModul ;


  }
 }