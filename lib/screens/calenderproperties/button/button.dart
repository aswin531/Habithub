import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_hub/themes/colors.dart';

class CalenderButton extends StatelessWidget {
  const CalenderButton({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        child: DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor: yellow,
      selectedTextColor: black,
      dateTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: black),
      ),
      dayTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: black),
      ),
    ));
  }
}
