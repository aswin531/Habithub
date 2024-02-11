import 'package:flutter/material.dart';
import 'package:habit_hub/themes/colors.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  // ignore: unused_field
  String? _selectedItem;

  final items = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        decoration: const BoxDecoration(color: grey),
      ),
    );
  }
}
