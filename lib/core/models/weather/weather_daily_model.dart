import 'package:time_and_weather_app/core/models/weather/list_elements.dart';

class WeatherDailyModel {
  final List<ListElement> list;

  WeatherDailyModel({
    required this.list,
  });

  WeatherDailyModel.fromJson(Map<String, dynamic> json)
      : list = List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x)));

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}
