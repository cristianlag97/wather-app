part of lib.core.models.weather;

class Coord {
  final double lat;
  final double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  Coord.fromJson(Map<String, dynamic> json)
      : lat = json["lat"]?.toDouble(),
        lon = json["lon"]?.toDouble();

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
