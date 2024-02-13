import '../entities/weather_entity.dart';

abstract class WeatherDatasource {
  Future<WeatherEntity> getWeather(String cityName);
  Future<WeatherEntity> getWeatherInitial(String latitude, String longitude);
}
