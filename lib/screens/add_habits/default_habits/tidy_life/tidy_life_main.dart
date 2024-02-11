import 'package:flutter/material.dart';

class TidyLifeScreen extends StatelessWidget {
  const TidyLifeScreen({super.key});

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
              'Tidy Life',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text('Everything has its own place')
          ],
        ),
      ),
    );
  }
}
