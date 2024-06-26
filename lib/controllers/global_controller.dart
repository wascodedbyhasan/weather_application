import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  final weatherData = WeatherData().obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  WeatherData getData() {
    return weatherData.value;
  }

  RxInt getIndex() {
    return _currentIndex;
  }

  @override
  void onInit() {
    super.onInit();
    if (_isLoading.isTrue) {
      _getLocation();
    } else {
      getIndex();
    }
  }

  Future<dynamic> _getLocation() async {
    bool? isServiceEnabled;
    LocationPermission? locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location services are disabled.");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied forever.");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied.");
      }
    }

    return await Geolocator.getCurrentPosition().then(
      (value) {
        _lattitude.value = value.latitude;
        _longitude.value = value.longitude;
        return FetchWeatherAPI()
            .processData(value.latitude, value.longitude)
            .then(
          (value) {
            if (value != null) {
              weatherData.value = value;
            }
            _isLoading.value = false;
          },
        );
      },
    );
  }
}
