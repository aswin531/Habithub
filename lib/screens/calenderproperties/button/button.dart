import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
      selectionColor: blue,
      selectedTextColor: black,
      dateTextStyle: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Get.isDarkMode ? Colors.white : bluesgrey),
      ),
      dayTextStyle: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Get.isDarkMode ? Colors.white : bluesgrey),
      ),
      monthTextStyle: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Get.isDarkMode ? Colors.white : bluesgrey),
      ),
    ));
  }
}
