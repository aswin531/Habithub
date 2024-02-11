import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Level up your life!',
            style: TextStyle(
                fontSize: 30, color: primary, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: 300,
              width: 700,
              child: Image.asset('assets/images/screen2.png')),
          const Text(
            'Transform your habits,\ntransform your life',
            style: TextStyle(
                fontSize: 20, color: primary, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
