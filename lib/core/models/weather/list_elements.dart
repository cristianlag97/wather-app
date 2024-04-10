import '../models.dart';

class ListElement {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  final DateTime dtTxt;

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  ListElement.fromJson(Map<String, dynamic> json)
      : dt = json["dt"],
        main = Main.fromJson(json["main"]),
        weather =
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds = Clouds.fromJson(json["clouds"]),
        wind = Wind.fromJson(json["wind"]),
        visibility = json["visibility"],
        pop = json["pop"]?.toDouble(),
        sys = Sys.fromJson(json["sys"]),
        dtTxt = DateTime.parse(json["dt_txt"]);

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys.toJson(),
        "dt_txt": dtTxt.toIso8601String(),
      };
}
