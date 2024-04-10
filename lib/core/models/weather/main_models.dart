part of lib.core.models.weather;

class Main {
  final double feelsLike;
  final double temp;
  final double tempMax;
  final double tempMin;
  final int grndLevel;
  final int humidity;
  final int pressure;
  final int seaLevel;
  final double tempKf;

  Main({
    required this.feelsLike,
    required this.grndLevel,
    required this.humidity,
    required this.pressure,
    required this.seaLevel,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.tempKf,
  });

  Main.fromJson(Map<String, dynamic> json)
      : feelsLike = json["feels_like"].toDouble() ?? 0,
        grndLevel = json["grnd_level"] ?? 0,
        humidity = json["humidity"] ?? 0,
        pressure = json["pressure"] ?? 0,
        seaLevel = json["sea_level"] ?? 0,
        tempMax = json["temp_max"]?.toDouble() ?? 0,
        tempMin = json["temp_min"]?.toDouble() ?? 0,
        tempKf = json["temp_kf"]?.toDouble() ?? 0,
        temp = json["temp"]?.toDouble() ?? 0;

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "temp_kf": tempKf,
      };
}
