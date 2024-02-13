import 'package:flutter/material.dart';

class AditionalInformations extends StatelessWidget {
  const AditionalInformations({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
    required this.isDay,
  });
  final String title;
  final IconData icon;
  final String description;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        Text(
          title,
          style: textStyle.bodySmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              description,
              style: textStyle.bodySmall!.copyWith(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
