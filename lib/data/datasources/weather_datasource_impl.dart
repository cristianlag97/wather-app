import 'package:flutter/material.dart';
import 'package:time_and_weather_app/config/plugins/dio_plugin.dart';
import 'package:time_and_weather_app/domain/domain.dart';

import '../../core/core.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  @override
  Future<WeatherEntity> getWeather(String cityName) async {
    try {
      final response =
          await dioWeather.get('/weather', queryParameters: {'q': cityName});
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
    });
    final weatherMapper = WeatherMapper.weatherToEntity(response.data);
    return weatherMapper;
  }
}
//TODO: https://api.openweathermap.org/data/2.5/forecast?q=Neiva&appid=TU_API_KEY



