import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/domain/repositories/weather_repository.dart';
import 'package:time_and_weather_app/presentation/provider/weather/weather_state.dart';

import '../location/location_state.dart';

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier(this.weatherRepository, this.position)
      : super(const WeatherState()) {
    getWeatherinitialize();
    getTimeOfDay();
  }

  final WeatherRepository weatherRepository;
  final LocationState position;

  Future<void> getWeatherinitialize() async {
    try {
      state = state.copyWith(isLoading: true);
      final resp = await weatherRepository.getWeatherInitial(
        position.latitude.toString(),
        position.longitude.toString(),
      );
      if (mounted) {
        state = state.copyWith(
          weatherEntity: resp,
          isLoading: false,
          dateTime: DateTime.now(),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getWeather(String cityName) async {
    state = state.copyWith(isLoading: true);
    try {
      final resp = await weatherRepository.getWeather(cityName);
      state = state.copyWith(weatherEntity: resp, isLoading: false);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTimeOfDay() async {
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;

    if ((hour == 5 && minute >= 30) || (hour > 5 && hour < 17)) {
      state = state.copyWith(dayState: DayNightState.day);
    } else if ((hour == 17 && minute >= 30) || (hour > 18 && hour < 19)) {
      state = state.copyWith(dayState: DayNightState.sunrise);
    } else if ((hour >= 19) || (hour < 5) || (hour == 5 && minute < 30)) {
      state = state.copyWith(dayState: DayNightState.night);
    } else {
      state = state.copyWith(dayState: DayNightState.sunrise);
    }
  }
}
