import 'package:flutter/material.dart';

import '../../add_habits/default_habits/mainhabitlist.dart';

class BottomCategories extends StatelessWidget {
  const BottomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Expanded(child: MainHabitsList()),
      ],
    )));
  }
}
