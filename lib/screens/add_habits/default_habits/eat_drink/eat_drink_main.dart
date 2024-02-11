import 'package:flutter/material.dart';

class EatDrinkScreen extends StatelessWidget {
  const EatDrinkScreen({super.key});

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
              'Eat&Drink Healthily',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text('Stay healthy with daily intakes')
          ],
        ),
      ),
    );
  }
}
