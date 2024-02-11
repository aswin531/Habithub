import 'package:flutter/material.dart';

class EaseStressScreen extends StatelessWidget {
  const EaseStressScreen({super.key});

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
              'Ease Stress',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text('Your efforts deserves a break')
          ],
        ),
      ),
    );
  }
}
