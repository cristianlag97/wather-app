import 'package:flutter/material.dart' show Color;

import '../../presentation/provider/weather/weather_state.dart';
import '../config.dart';

List<Color> getColor(dayState) {
  switch (dayState) {
    case DayNightState.night:
      return [primaryColornigh, secundaryColorNigh, theirdaryColorNight];
    case DayNightState.sunrise:
      return [primaryCiolorDay, otroColorAzul, sunraceColor];
    case DayNightState.sunset:
      return [primaryCiolorDay, otroColorAzul, sunraceColor];
    case DayNightState.day:
    default:
      return [primaryCiolorDay, otroColorAzul, secundaryColorDay];
  }
}
