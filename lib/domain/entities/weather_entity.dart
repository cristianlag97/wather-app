import '../../core/models/models.dart';

class WeatherEntity {
  final String city;
  final List<Weather> weather;
  final Main main;
  final int visibility;

  WeatherEntity({
    required this.city,
    required this.weather,
    required this.main,
    required this.visibility,
  });
}
