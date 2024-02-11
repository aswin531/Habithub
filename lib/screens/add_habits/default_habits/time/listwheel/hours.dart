import 'package:flutter/cupertino.dart';
import 'package:habit_hub/themes/colors.dart';

// ignore: must_be_immutable
class Myhours extends StatelessWidget {
  int hours;
  Myhours({super.key, required this.hours});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Center(
        child: Text(
          hours.toString(),
          style: const TextStyle(fontSize: 40, color: white),
        ),
      ),
    );
  }
}
