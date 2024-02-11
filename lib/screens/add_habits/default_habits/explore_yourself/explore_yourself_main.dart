import 'package:flutter/material.dart';

class ExploreYourselfScreen extends StatelessWidget {
  const ExploreYourselfScreen({super.key});

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
              'Explore Yourself',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              'Discover your inner unknowns',
            )
          ],
        ),
      ),
    );
  }
}
