part of lib.core.models.weather;

class WeatherApiResponse {
  final String base;
  final Clouds clouds;
  final int cod;
  final Coord coord;
  final int dt;
  final int id;
  final Main main;
  final String name;
  final Sys sys;
  final int timezone;
  final int visibility;
  final List<Weather> weather;
  final Wind wind;

  WeatherApiResponse({
    required this.base,
    required this.clouds,
    required this.cod,
    required this.coord,
    required this.dt,
    required this.id,
    required this.main,
    required this.name,
    required this.sys,
    required this.timezone,
    required this.visibility,
    required this.weather,
    required this.wind,
  });

  WeatherApiResponse.fromJson(Map<String, dynamic> json)
      : base = json["base"],
        clouds = Clouds.fromJson(json["clouds"]),
        cod = json["cod"],
        coord = Coord.fromJson(json["coord"]),
        dt = json["dt"],
        id = json["id"],
        main = Main.fromJson(json["main"]),
        name = json["name"],
        sys = Sys.fromJson(json["sys"]),
        timezone = json["timezone"],
        visibility = json["visibility"],
        weather =
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        wind = Wind.fromJson(json["wind"]);

  Map<String, dynamic> toJson() => {
        "base": base,
        "clouds": clouds.toJson(),
        "cod": cod,
        "coord": coord.toJson(),
        "dt": dt,
        "id": id,
        "main": main.toJson(),
        "name": name,
        "sys": sys.toJson(),
        "timezone": timezone,
        "visibility": visibility,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "wind": wind.toJson(),
      };
}
