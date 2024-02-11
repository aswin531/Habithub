import 'package:flutter/material.dart';

class LeisureMomentsScreen extends StatelessWidget {
  const LeisureMomentsScreen({super.key});

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
              'Leisure moments',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              'Live yourlifeto the max',
            )
          ],
        ),
      ),
    );
  }
}
