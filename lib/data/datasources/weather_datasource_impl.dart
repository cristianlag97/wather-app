import 'package:flutter/material.dart';
import 'package:time_and_weather_app/config/plugins/dio_plugin.dart';
import 'package:time_and_weather_app/core/mappers/weather_daily_mapper.dart';
import 'package:time_and_weather_app/domain/domain.dart';

import '../../core/core.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  @override
  Future<WeatherEntity> getWeather(String cityName) async {
    try {
      final response = await dioWeather.get('/weather', queryParameters: {
        'q': cityName,
        'units': 'metric',
        'lang': 'es-ES',
      });
      final weatherMapper = WeatherMapper.weatherToEntity(response.data);
      return weatherMapper;
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  @override
  Future<WeatherEntity> getWeatherInitial(
    String latitude,
    String longitude,
  ) async {
    final response = await dioWeather.get('/weather', queryParameters: {
      'lat': latitude,
      'lon': longitude,
      'units': 'metric',
      'lang': 'es-ES',
    });
    final weatherMapper = WeatherMapper.weatherToEntity(response.data);
    return weatherMapper;
  }

  @override
  Future<WeatherDailyEntity> getweatherDaily(String cityName) async {
    final response = await dioWeather.get('/forecast', queryParameters: {
      'q': cityName,
      'exclude': 'hourly',
      'units': 'metric',
      'cnt': 8,
    });
    final weatherDailyMapper =
        WeatherDailyMapper.weatherDailyEntity(response.data);
    return weatherDailyMapper;
  }
}
