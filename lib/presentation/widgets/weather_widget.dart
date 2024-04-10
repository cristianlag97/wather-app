import 'package:flutter/material.dart';
import 'package:time_and_weather_app/domain/entities/weather_entity.dart';

import '../../config/helpers/get_weather_and_image.dart';
import '../provider/weather/weather_state.dart';

class Weather extends StatelessWidget {
  const Weather({
    super.key,
    required this.weather,
    required this.size,
    required this.weatherState,
    required this.textStyle,
  });

  final WeatherEntity? weather;
  final Size size;
  final WeatherState weatherState;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              getImage(weather!.weather.first.main),
              width: size.width * 0.25,
            ),
            Text(
              '${weatherState.actualTemperature.floor()}°',
              style: textStyle.bodyMedium!.copyWith(
                color: Colors.white, fontSize: size.height * 0.1,
                // fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${weatherState.actualTemperatureMax.floor()}° / ${weatherState.actualTemperatureMin.floor()}° ',
              style: textStyle.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Se siente como ',
              style: textStyle.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${weatherState.actualFeelsLike.floor()}° ',
              style: textStyle.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          mapWeatherCondition(weather!.weather.first.description),
          style: textStyle.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
