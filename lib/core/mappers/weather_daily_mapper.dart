import 'package:time_and_weather_app/core/models/weather/weather_daily_model.dart';
import 'package:time_and_weather_app/domain/domain.dart';

class WeatherDailyMapper {
  static WeatherDailyEntity weatherDailyEntity(Map<String, dynamic> json) {
    final weatherDailyModel = WeatherDailyModel.fromJson(json);

    return WeatherDailyEntity(listElement: weatherDailyModel.list);
  }
}
