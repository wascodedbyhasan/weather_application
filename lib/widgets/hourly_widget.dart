import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/models/weather_data_forecast.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataForecast? weatherDataForecast;

  final RxInt cardIndex = GlobalController().getIndex();

  HourlyDataWidget({
    super.key,
    required this.weatherDataForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          alignment: Alignment.topCenter,
          child: const Text(
            "Today",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataForecast?.forecast.forecastday?[0].hour?.length,
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: CustomColors.dividerLine.withAlpha(
                        150,
                      ),
                    ),
                  ],
                  gradient: cardIndex.value == index
                      ? const LinearGradient(
                          colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor,
                          ],
                        )
                      : null,
                ),
                child: HourlyDetails(
                  temp: weatherDataForecast!
                      .forecast.forecastday![0].hour![index].tempC!
                      .toInt(),
                  tempStamp: weatherDataForecast!
                      .forecast.forecastday![0].hour![index].timeEpoch!,
                  weatherIcon: weatherDataForecast!
                      .forecast.forecastday![0].hour![index].condition!.icon!,
                  index: index,
                  cardIndex: cardIndex.toInt(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int temp;
  final int tempStamp;
  final String weatherIcon;
  final int index;
  final int cardIndex;

  const HourlyDetails({
    super.key,
    required this.temp,
    required this.tempStamp,
    required this.weatherIcon,
    required this.index,
    required this.cardIndex,
  });

  String getTime(final tempStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(tempStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            getTime(
              tempStamp,
            ),
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomColors.textColorBlack,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(
            5,
          ),
          child: Image.network(
            "http:$weatherIcon",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("$temp°"),
        ),
      ],
    );
  }
}
