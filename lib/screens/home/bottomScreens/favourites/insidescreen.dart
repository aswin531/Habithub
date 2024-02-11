import 'package:flutter/material.dart';
import 'package:habit_hub/db/models/habit/user_habit.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:intl/intl.dart';

class InsideFavouritesScreen extends StatelessWidget {
  final HabitModel habit;

  const InsideFavouritesScreen({Key? key, required this.habit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE HH:mm').format(DateTime.parse(habit.date ?? ''));

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgfavourites.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${habit.habitname}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Date: $formattedDate',
                style: const TextStyle(
                  fontSize: 18,
                  color: grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
