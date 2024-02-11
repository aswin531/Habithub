import 'package:flutter/material.dart';

class EssentialsScreen extends StatelessWidget {
  const EssentialsScreen({super.key});

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
              'Essential Habits',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text('Refresh your life with simple acts')
          ],
        ),
      ),
    );
  }
}
