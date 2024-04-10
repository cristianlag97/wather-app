import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/data/data.dart';

final weatherProvider = Provider(
    (ref) => WeatherRepositoryImpl(weatherDatasource: WeatherDatasourceImpl()));

final weatherDailyProvider = FutureProvider((ref) async {
  final weatherDaily =
      await ref.watch(weatherProvider).getweatherDaily('Neiva');
  return weatherDaily;
});
