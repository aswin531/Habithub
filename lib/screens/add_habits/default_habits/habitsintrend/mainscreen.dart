import 'package:flutter/material.dart';
import 'package:habit_hub/screens/add_habits/default_habits/featured_habits.dart';

class HabitsInTrend extends StatelessWidget {
  const HabitsInTrend({super.key});

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
              'Habits in trend',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text('Keep up the pace with the world')
          ],
        ),
      ),
      body: FeaturedHabits(),
    );
  }
}
