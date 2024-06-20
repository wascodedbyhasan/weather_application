class WeatherDataCurrent {
  final Current current;

  WeatherDataCurrent({
    required this.current,
  });

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  double? tempC;
  Condition? condition;
  double? windKph;
  double? humidity;
  int? cloud;
  double? feelslikeC;
  double? uv;

  Current({
    this.tempC,
    this.condition,
    this.windKph,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: (json['temp_c'] as num?)?.toDouble(),
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        humidity: (json['humidity'] as num?)?.toDouble(),
        cloud: json['cloud'] as int?,
        feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
        uv: (json['uv'] as num?)?.toDouble(),
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
