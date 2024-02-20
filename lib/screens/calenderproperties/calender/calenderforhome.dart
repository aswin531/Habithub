import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/styles/textstyles/textstyles.dart';
import 'package:intl/intl.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CustomCalenderState createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  late DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('EEEE, d ').format(_selectedDate),
                        style: HeadingStyle,
                      ),
                      IconButton(
                        onPressed: () async {
                          final DateTime? newDate =
                              await _showDatePicker(context);
                          if (newDate != null) {
                            setState(() {
                              _selectedDate = newDate;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_month_rounded,
                          size: 40,
                          color: favcolor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Today',
                    style: MainHeadingStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      barrierColor: black,
    );
  }
}
