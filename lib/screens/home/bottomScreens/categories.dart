import 'package:flutter/material.dart';
import 'package:habit_hub/themes/colors.dart';

import '../../add_habits/default_habits/mainhabitlist.dart';

class BottomCategories extends StatelessWidget {
  const BottomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: searchcolor,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text('Refresh your life with simple acts')
            ],
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(child: MainHabitsList()),
          ],
        )));
  }
}
