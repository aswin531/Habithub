import 'package:flutter/material.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DonutProgressIndicator extends StatelessWidget {
  const DonutProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparent,
      body: Center(
        child: Container(
          color: transparent,
          child: CircularPercentIndicator(
              radius: 70,
              lineWidth: 15,
              percent: 0.40,
              progressColor: white,
              circularStrokeCap: CircularStrokeCap.round,
              center: const Text(
                '40% ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
