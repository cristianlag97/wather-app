import 'package:time_and_weather_app/domain/domain.dart';

import '../core.dart';

class WeatherMapper {
  static WeatherEntity weatherToEntity(Map<String, dynamic> json) {
    final weatherModel = WeatherApiResponse.fromJson(json);

    return WeatherEntity(
      city: weatherModel.name,
      weather: weatherModel.weather,
      main: weatherModel.main,
      visibility: weatherModel.visibility,
    );
  }
}
