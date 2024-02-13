import 'package:time_and_weather_app/domain/domain.dart';

import '../datasources/weather_datasource_impl.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource weatherDatasource;

  WeatherRepositoryImpl({WeatherDatasource? weatherDatasource})
      : weatherDatasource = weatherDatasource ?? WeatherDatasourceImpl();

  @override
  Future<WeatherEntity> getWeather(String cityName) {
    return weatherDatasource.getWeather(cityName);
  }

  @override
  Future<WeatherEntity> getWeatherInitial(String latitude, String longitude) {
    return weatherDatasource.getWeatherInitial(latitude, longitude);
  }
}
