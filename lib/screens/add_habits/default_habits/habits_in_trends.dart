import 'package:flutter/material.dart';

class HabitsinTrends extends StatelessWidget {
  const HabitsinTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Featured Habits',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body:const Center(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
        ),
      
      ),
    );
  }
}
