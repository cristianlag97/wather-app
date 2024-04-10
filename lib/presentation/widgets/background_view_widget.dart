import 'package:flutter/material.dart';

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
