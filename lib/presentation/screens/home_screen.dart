import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/config/helpers/get_weather_and_image.dart';
import 'package:time_and_weather_app/config/helpers/helpers.dart';
import 'package:time_and_weather_app/domain/entities/weather_entity.dart';
import 'package:time_and_weather_app/presentation/presentation.dart';

import 'package:time_and_weather_app/presentation/provider/weather/wather_provider.dart';

import '../provider/weather/weather_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);

    if (weatherState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (weatherState.messageError.isNotEmpty) {
      return Scaffold(
        body: Center(
          child: Text(weatherState.messageError),
        ),
      );
    }

    if (weatherState.weatherEntity != null) {
      return Scaffold(
        body: WeatherBackground(
          colors: getColor(weatherState.dayState),
          child: _WeatherView(weatherState: weatherState),
        ),
      );
    }
    return Container();
  }
}

class WeatherBackground extends StatelessWidget {
  const WeatherBackground({
    super.key,
    required this.child,
    required this.colors,
  });

  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2, 0.6, 1.0],
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}

class _WeatherView extends StatelessWidget {
  const _WeatherView({
    required this.weatherState,
  });

  final WeatherState weatherState;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    final weather = weatherState.weatherEntity;
    return Column(
      children: <Widget>[
        SizedBox(height: size.height * 0.04),
        HeaderHome(weather: weather, textStyle: textStyle),
        SizedBox(height: size.height * 0.01),
        Image.asset(
          getImage(weather!.weather.first.main),
          // width: size.width * 0.4,
          scale: 0.7,
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          mapWeatherCondition(weather.weather.first.main),
          style: textStyle.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          '${weatherState.actualTemperature.toStringAsFixed(2)}°',
          style: textStyle.titleLarge!.copyWith(
            color: Colors.white,
            // fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        const IntormationAditionalOfView()
      ],
    );
  }
}

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
