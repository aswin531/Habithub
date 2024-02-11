import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'We Help You Start building positive\nhabits with Habit Hub track your progress\nand achieve your goals effortlessly.',
          style: TextStyle(
              color: primary, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset('assets/images/plan.png')
      ]),
    );
  }
}



