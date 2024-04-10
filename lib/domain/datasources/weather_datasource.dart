import '../domain.dart';

abstract class WeatherDatasource {
  Future<WeatherEntity> getWeather(String cityName);
  Future<WeatherEntity> getWeatherInitial(String latitude, String longitude);
  Future<WeatherDailyEntity> getweatherDaily(String cityName);
}
