import 'dart:convert';

import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/models/weather_data_forecast.dart';

class FetchWeatherAPI {
  late final WeatherData? weatherData;

  Future<WeatherData?> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = json.decode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataForecast.fromJson(jsonString),
    );
    return weatherData;
  }
}

String apiURL(lat, lon) {
  String url;
  url =
      "http://api.weatherapi.com/v1/forecast.json?key=243f290602294befb6d223245222012&q=$lat,$lon&days=7";
  return url;
}
