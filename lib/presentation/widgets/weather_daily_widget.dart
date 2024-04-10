import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:time_and_weather_app/core/models/weather/list_elements.dart';
import 'package:time_and_weather_app/presentation/provider/weather_daily/weather_daily_provider.dart';

import '../../config/helpers/get_weather_and_image.dart';

class WeatherDailyBackground extends StatelessWidget {
  const WeatherDailyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.center,
      width: size.width,
      height: size.height * 0.21,
      child: const WeatherDaily(),
    );
  }
}

class WeatherDaily extends ConsumerWidget {
  const WeatherDaily({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDailyAsync = ref.watch(weatherDailyProvider);

    return weatherDailyAsync.when(
      data: (data) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.listElement.length,
        itemBuilder: (BuildContext context, int index) {
          final element = data.listElement[index];

          return Daily(element: element, index: index);
        },
      ),
      error: (Object error, StackTrace stackTrace) => Center(
        child: Text('Error: $error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class Daily extends StatelessWidget {
  const Daily({
    super.key,
    required this.element,
    required this.index,
  });

  final ListElement element;
  final int index;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(
        left: index == 0 ? 20 : 8,
        right: index == 7 ? 20 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            DateFormat('hh a').format(element.dtTxt),
            style: textStyle.bodySmall!.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          const SizedBox(height: 8),
          Image.asset(
            getImage(element.weather.first.main),
            scale: 1.5,
          ),
          const SizedBox(height: 8),
          Text(
            '${element.main.temp.ceil()}°',
            style: textStyle.bodyMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
