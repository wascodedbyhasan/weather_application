import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/models/weather_data_forecast.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataForecast? forecast;

  WeatherData([
    this.current,
    this.forecast,
  ]);

  WeatherDataCurrent? getCurrentWeather() => current;
  WeatherDataForecast? getForecastWeather() => forecast;
}
