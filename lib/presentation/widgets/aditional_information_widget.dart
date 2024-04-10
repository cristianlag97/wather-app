import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });
  final String title;
  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: textStyle.bodySmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
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
