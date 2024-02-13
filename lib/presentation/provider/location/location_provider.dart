import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/presentation/provider/location/location_notifier.dart';
import 'package:time_and_weather_app/presentation/provider/location/location_state.dart';

final locationProvider =
    StateNotifierProvider<LocationNotifier, LocationState>((ref) {
  return LocationNotifier();
});
