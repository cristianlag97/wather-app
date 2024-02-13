import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/presentation/provider/weather/wather_provider.dart';

import '../presentation.dart';

class IntormationAditionalOfView extends ConsumerWidget {
  const IntormationAditionalOfView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AditionalInformations(
                isDay: true, //TODO: Eliminar esta linea
                title: 'Pressure',
                icon: Icons.cloudy_snowing,
                description: weather.weatherEntity!.main.pressure.toString(),
              ),
              AditionalInformations(
                isDay: true, //TODO: Eliminar esta linea
                title: 'Visibility',
                icon: Icons.remove_red_eye_rounded,
                description: weather.visibilityKm,
              ),
              AditionalInformations(
                isDay: true, //TODO: Eliminar esta linea
                title: 'Humidity',
                icon: Icons.water_drop_rounded,
                description: '${weather.weatherEntity!.main.humidity}%',
              )
            ],
          ),
        ],
      ),
    );
  }
}
