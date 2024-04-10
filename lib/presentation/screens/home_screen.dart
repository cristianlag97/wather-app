import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_and_weather_app/config/helpers/helpers.dart';
import 'package:time_and_weather_app/presentation/presentation.dart';

import 'package:time_and_weather_app/presentation/provider/weather/weather_provider.dart';
import 'package:time_and_weather_app/presentation/widgets/weather_daily_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    ref.read(weatherProvider.notifier).getWeatherinitialize();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);

    if (weatherState.isLoading) {
      return Scaffold(
        body: Center(
          child: Image.asset('assets/images/loading.gif'),
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
          child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              edgeOffset: 0,
              onRefresh: () => _onRefresh(ref),
              child: const SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: _WeatherView(),
              )),
        ),
      );
    }
    return Container();
  }
}

class _WeatherView extends ConsumerWidget {
  const _WeatherView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    final weatherState = ref.watch(weatherProvider);
    final weather = weatherState.weatherEntity;
    return Column(
      children: <Widget>[
        SizedBox(height: size.height * 0.04),
        HeaderHome(weather: weather, textStyle: textStyle),
        SizedBox(height: size.height * 0.01),
        Weather(
          weather: weather,
          size: size,
          weatherState: weatherState,
          textStyle: textStyle,
        ),
        SizedBox(height: size.height * 0.1),
        const WeatherDailyBackground(),
        SizedBox(height: size.height * 0.1),
        const InformationAdditionalOfView(),
      ],
    );
  }
}
