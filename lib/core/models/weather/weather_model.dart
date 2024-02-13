part of lib.core.models.weather;

class Weather {
  final String description;
  final String icon;
  final int id;
  final String main;

  Weather({
    required this.description,
    required this.icon,
    required this.id,
    required this.main,
  });

  Weather.fromJson(Map<String, dynamic> json)
      : description = json["description"],
        icon = json["icon"],
        id = json["id"],
        main = json["main"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
