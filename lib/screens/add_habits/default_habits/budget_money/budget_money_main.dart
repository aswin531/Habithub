import 'package:flutter/material.dart';

class BudgetMoneyScreen extends StatelessWidget {
  const BudgetMoneyScreen({super.key});

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
              'Budget Money',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text('Financial wellness made simple')
          ],
        ),
      ),
    );
  }
}
