import 'package:flutter/material.dart';

class SleepRoutineSCreen extends StatelessWidget {
  const SleepRoutineSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sleep Routine',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              'May your dream be sweet tonight',
            )
          ],
        ),
      ),
    );
  }
}
