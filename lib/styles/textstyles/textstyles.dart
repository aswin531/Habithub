// ignore_for_file: non_constant_identifier_names

// ignore: implementation_imports
import 'package:flutter/material.dart';
// ignore: unnecessary_import, implementation_imports
import 'package:flutter/src/painting/text_style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_hub/themes/colors.dart';

TextStyle get HeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : grey));
}

TextStyle get SubHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}
