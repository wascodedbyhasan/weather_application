import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather_data_forecast.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyWidget extends StatelessWidget {
  final WeatherDataForecast? weatherDataForecast;

  const DailyWidget({
    super.key,
    required this.weatherDataForecast,
  });

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(
        25,
      ),
      padding: const EdgeInsets.all(
        25,
      ),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(
          150,
        ),
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "Next Days",
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataForecast?.forecast.forecastday?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 80,
                        child: Text(
                          getDay(
                            weatherDataForecast
                                ?.forecast.forecastday?[index].dateEpoch,
                          ),
                          style: const TextStyle(
                            color: CustomColors.textColorBlack,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.network(
                          "http:${weatherDataForecast?.forecast.forecastday?[index].day?.condition?.icon}",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${weatherDataForecast?.forecast.forecastday?[index].day?.maxtempC?.toInt()}°/${weatherDataForecast?.forecast.forecastday?[index].day?.mintempC?.toInt()}°",
                        style: const TextStyle(
                          color: CustomColors.textColorBlack,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
