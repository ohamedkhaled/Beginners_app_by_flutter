import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/Weather_Model.dart';

class WeatherServices {
  String BaseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '330c74f31dd2489daee230140222208';


  Future<WeatherModul?> getWeather({required CityName}) async {
    WeatherModul? weatherModul;
    try {
      Uri url = Uri.parse('$BaseUrl/forecast.json?key=$apiKey&q=$CityName');

      http.Response response = await http.get(url) as http.Response;

      Map<String, dynamic> data = jsonDecode(response.body);
      weatherModul = WeatherModul.fromJson(data);
    }
    catch (e) {
      print(e.toString());
    }
    return weatherModul;
  }
}
