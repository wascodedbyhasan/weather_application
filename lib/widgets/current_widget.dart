import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent? weatherDataCurrent;

  const CurrentWeatherWidget({
    super.key,
    required this.weatherDataCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        const SizedBox(
          height: 20,
        ),
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(
          "http:${weatherDataCurrent?.current.condition?.icon}",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent?.current.tempC!.toInt()}°",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textColorBlack,
                ),
              ),
              TextSpan(
                text:
                    "${weatherDataCurrent?.current.condition?.text?.toUpperCase()}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent?.current.windKph} km/h",
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "%${weatherDataCurrent?.current.cloud}",
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "%${weatherDataCurrent?.current.humidity}",
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
