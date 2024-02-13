import 'package:equatable/equatable.dart';
import 'package:time_and_weather_app/domain/domain.dart';

enum DayNightState {
  day,
  sunset,
  night,
  sunrise,
}

class WeatherState extends Equatable {
  final bool isLoading;
  final String messageError;
  final WeatherEntity? weatherEntity;
  final DateTime? dateTime;
  final DayNightState dayState;

  const WeatherState({
    this.isLoading = false,
    this.dayState = DayNightState.day,
    this.messageError = '',
    this.weatherEntity,
    this.dateTime,
  });

  WeatherState copyWith({
    bool? isLoading,
    String? messageError,
    WeatherEntity? weatherEntity,
    DateTime? dateTime,
    DayNightState? dayState,
  }) =>
      WeatherState(
        isLoading: isLoading ?? this.isLoading,
        messageError: messageError ?? this.messageError,
        weatherEntity: weatherEntity ?? this.weatherEntity,
        dateTime: dateTime ?? this.dateTime,
        dayState: dayState ?? this.dayState,
      );

  double get actualTemperature => (weatherEntity!.main.temp - 273.15);

  String get visibilityKm =>
      '${(weatherEntity!.visibility / 1000).toStringAsFixed(0)}Km';

  @override
  List<Object?> get props => [
        isLoading,
        messageError,
        dateTime,
        weatherEntity ?? {},
        dateTime ?? {},
        dayState,
      ];
}
