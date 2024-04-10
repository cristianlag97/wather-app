import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/presentation/provider/weather/weather_provider.dart';

import '../presentation.dart';

class InformationAdditionalOfView extends ConsumerWidget {
  const InformationAdditionalOfView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(weatherProvider);
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height * 0.13,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AdditionalInformation(
                  title: 'Pressure',
                  icon: Icons.cloudy_snowing,
                  description: weather.weatherEntity!.main.pressure.toString(),
                ),
                Container(
                  width: 1,
                  height: size.height * 0.04,
                  color: Colors.white,
                ),
                AdditionalInformation(
                  title: 'Humidity',
                  icon: Icons.water_drop_rounded,
                  description: '${weather.weatherEntity!.main.humidity}%',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
