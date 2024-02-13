import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/data/data.dart';
import 'package:time_and_weather_app/presentation/provider/weather/weather_notifier.dart';
import 'package:time_and_weather_app/presentation/provider/weather/weather_state.dart';

import '../location/location_provider.dart';

final weatherRepositoryProvider = Provider(
  (ref) => WeatherRepositoryImpl(weatherDatasource: WeatherDatasourceImpl()),
);

final weatherProvider =
    StateNotifierProvider.autoDispose<WeatherNotifier, WeatherState>((ref) {
  final position = ref.watch(locationProvider);
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return WeatherNotifier(weatherRepository, position);
});
