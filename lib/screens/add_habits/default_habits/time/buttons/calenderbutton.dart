import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:intl/intl.dart';

class CalenderButtonScreen extends StatefulWidget {
  final Function(DateTime)? onDateSelected;

  const CalenderButtonScreen({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  State<CalenderButtonScreen> createState() => _CalenderButtonScreenState();
}

class _CalenderButtonScreenState extends State<CalenderButtonScreen> {
  late DateTime selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // selectedDate = DateTime.now();
    _dateController.text = DateFormat("dd-MM-yyyy").format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      // height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        color: green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: _dateController,
        cursorColor: green,
        style: const TextStyle(fontSize: 16), // Adjust the font size as needed
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: DateFormat("dd-MM-yyyy").format(selectedDate),
          hintStyle: const TextStyle(
              color: white, fontSize: 14), // Adjust the font size as needed
          suffixIcon: IconButton(
            onPressed: () async {
              // ignore: no_leading_underscores_for_local_identifiers
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null && pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                  _dateController.text =
                      DateFormat("dd-MM-yyyy").format(selectedDate);
                });

                if (widget.onDateSelected != null) {
                  widget.onDateSelected!(DateFormat("dd-MM-yyyy")
                      .format(selectedDate) as DateTime);
                }
              }
            },
            icon: FaIcon(
              FontAwesomeIcons.solidCalendarDays,
              size: 18, // Adjust the size as needed
              color: Colors.grey[350],
            ),
          ),
        ),
      ),
    );
  }
}
