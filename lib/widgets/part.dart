import 'package:flutter/material.dart';
import 'package:headphone_ui/widgets/battery_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PartWidget extends StatelessWidget {
  const PartWidget(
      {super.key, required this.partImage, required this.batterPercent});

  final Image partImage;
  final int batterPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [partImage],
        ),
        const SizedBox(height: 8),
        Row(children: <Widget>[
          LinearPercentIndicator(
            width: 100.0,
            lineHeight: 8.0,
            barRadius: Radius.circular(24),
            percent: batterPercent / 100,
            progressColor: const Color.fromARGB(255, 5, 50, 252),
          ),
        ]),
        const SizedBox(height: 8),
        Row(
          children: [
            BatteryIndicator(
              prefix: 'L',
              batterPercent: batterPercent,
            )
          ],
        ),
      ],
    );
  }
}
