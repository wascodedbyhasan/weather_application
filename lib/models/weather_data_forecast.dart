class WeatherDataForecast {
  final Forecast forecast;

  WeatherDataForecast({
    required this.forecast,
  });

  factory WeatherDataForecast.fromJson(Map<String, dynamic> json) =>
      WeatherDataForecast(forecast: Forecast.fromJson(json['forecast']));
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: (json['forecastday'] as List<dynamic>?)
            ?.map((e) => Forecastday.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Forecastday {
  int? dateEpoch;
  Day? day;
  List<Hour>? hour;

  Forecastday({
    this.dateEpoch,
    this.day,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        dateEpoch: json['date_epoch'] as int?,
        day: json['day'] == null
            ? null
            : Day.fromJson(json['day'] as Map<String, dynamic>),
        hour: (json['hour'] as List<dynamic>?)
            ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Day {
  double? maxtempC;
  double? mintempC;
  Condition? condition;

  Day({this.maxtempC, this.mintempC, this.condition});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
        mintempC: (json['mintemp_c'] as num?)?.toDouble(),
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      );
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  Condition? condition;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.condition,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json['time_epoch'] as int?,
        time: json['time'] as String?,
        tempC: json['temp_c'] as double?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      );
}

class Condition {
  String? text;
  String? icon;

  Condition({
    this.text,
    this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
      );
}
