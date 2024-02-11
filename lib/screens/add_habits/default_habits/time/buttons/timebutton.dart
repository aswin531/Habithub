import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';

class TimeButton extends StatefulWidget {
  const TimeButton({Key? key}) : super(key: key);

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  TimeOfDay _selectedTime = const TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.height * 0.045,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          foregroundColor: white,
          backgroundColor: green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          _selectTime(context);
        },
        child: const Padding(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Text(
            'SET TIME',
            style: TextStyle(color: white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (pickTime != null && pickTime != _selectedTime) {
      setState(() {
        _selectedTime = pickTime;
      });
    }
  }
}
