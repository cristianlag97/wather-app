import 'package:flutter/material.dart';

import '../../config/helpers/helpers.dart';
import '../../domain/entities/weather_entity.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required this.weather,
    required this.textStyle,
  });

  final WeatherEntity? weather;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: width * 0.08,
          ),
        ),
        Text(
          capitalize(weather!.city),
          style: textStyle.titleMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_outlined,
            color: Colors.white,
            size: width * 0.08,
          ),
        ),
      ],
    );
  }
}
