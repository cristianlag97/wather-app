part of lib.core.models.weather;

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  Clouds.fromJson(Map<String, dynamic> json) : all = json["all"];

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}
