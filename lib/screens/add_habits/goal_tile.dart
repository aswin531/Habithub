import 'package:flutter/material.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';
import 'package:habit_hub/themes/colors.dart';

class GoalSettingDrop extends StatefulWidget {
  const GoalSettingDrop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoalSettingDropState createState() => _GoalSettingDropState();
}

class _GoalSettingDropState extends State<GoalSettingDrop> {
  int _selectedDays = 7; // Default number of days
  int _selectedFrequency = 1; // Default frequency
  String _selectedOption = 'Everyday'; // Default option
  // ignore: unused_field
  final UserHabitServices _habitServices = UserHabitServices();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ExpansionTile(
        backgroundColor: goaltilecolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        childrenPadding: const EdgeInsets.all(8),
        collapsedBackgroundColor: goaltilecolor,
        collapsedShape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'Set Your Goal',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedOption,
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Everyday',
                    child: Text('Everyday'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Today',
                    child: Text('Today'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Onetime',
                    child: Text(
                      'Onetime',
                      // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Days:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  DropdownButton<int>(
                    value: _selectedDays,
                    items: <int>[3, 5, 7, 14, 21, 30].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedDays = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Duration per Day:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  DropdownButton<int>(
                    value: _selectedFrequency,
                    items: <int>[1, 2, 3, 4, 5].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedFrequency = newValue!;
                      });
                    },
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // Store the habit details in the database
                  _habitServices.addUserhabit(
                      _selectedOption,
                      '$_selectedDays days for $_selectedFrequency times',
                      _selectedOption);
                },
                icon: const Icon(
                  Icons.done_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
