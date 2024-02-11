import 'package:flutter/cupertino.dart';
import 'package:habit_hub/themes/colors.dart';

// ignore: must_be_immutable
class AmPmScreen extends StatelessWidget {
  final bool isAm;
  const AmPmScreen({super.key, required this.isAm});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Center(
        child: Text(
          isAm == true ? 'AM' : 'PM',
          style: const TextStyle(fontSize: 40, color: white),
        ),
      ),
    );
  }
}
