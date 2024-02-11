import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      // color: const Color(0xFFECC6DD),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/screen3bg.png'),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Tailor your habit tracking experience with\nHabit Hub.Personalize your goals and make\nlasting changes.Simplify your journey to a\nhealthier lifestyle with us habit tracking\nhas never been this easy .',
            style: TextStyle(
                color: primary, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
