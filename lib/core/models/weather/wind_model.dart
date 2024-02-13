part of lib.core.models.weather;

class Wind {
  final int deg;
  final double gust;
  final double speed;

  Wind({
    required this.deg,
    required this.gust,
    required this.speed,
  });

  Wind.fromJson(Map<String, dynamic> json)
      : deg = json["deg"] ?? 0,
        gust = json["gust"]?.toDouble() ?? 0,
        speed = json["speed"]?.toDouble() ?? 0;

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
