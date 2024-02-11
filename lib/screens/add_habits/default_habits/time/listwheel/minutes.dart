import 'package:flutter/cupertino.dart';
import 'package:habit_hub/themes/colors.dart';

// ignore: must_be_immutable
class MyMinutes extends StatelessWidget {
  int mins;
  MyMinutes({super.key, required this.mins});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Center(
        child: Text(
          mins < 10 ? '0$mins' : mins.toString(),
          style: const TextStyle(fontSize: 40, color: white),
        ),
      ),
    );
  }
}
