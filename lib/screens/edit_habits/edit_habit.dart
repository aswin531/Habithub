import 'package:flutter/material.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';
import 'package:habit_hub/db/models/habit/user_habit.dart';
import 'package:habit_hub/styles/textstyles/textstyles.dart';
import 'package:habit_hub/themes/colors.dart';

class EditHabitScreen extends StatefulWidget {
  final HabitModel habit;
  final int index;
  const EditHabitScreen({
    super.key,
    required this.index,
    required this.habit,
  });

  @override
  State<EditHabitScreen> createState() => _EditHabitScreenState();
}

class _EditHabitScreenState extends State<EditHabitScreen> {
  final TextEditingController _editingController = TextEditingController();
  late HabitModel updatedHabit;

  @override
  void initState() {
    super.initState();
    updatedHabit = widget.habit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  ' ${widget.habit.habitname}',
                  style: EditTextStyle,
                ),
                const Icon(
                  Icons.edit,
                  size: 30,
                ),
              ],
            ),
            Text(
              ' ${widget.habit.habitname} is editing now!',
              style: MainHeadingStyle,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _editingController,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(),
                    labelText: widget.habit.habitname,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: TextEditingController(text: updatedHabit.date),
                  onChanged: (value) {
                    setState(() {
                      updatedHabit.date = value;
                    });
                  },
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: 'Date',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller:
                      TextEditingController(text: widget.habit.selectedTime),
                  onChanged: (value) {
                    setState(() {
                      updatedHabit.selectedTime = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(),
                    labelText: widget.habit.selectedTime,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  saveChanges();
                },
                child: const Text('SAVE'),
              )
            ],
          ),
        ),
      ),
    );
  }
void updateChanges() async {
  UserHabitServices userHabitServices = UserHabitServices();
  String updatedName = _editingController.text;
  updatedHabit.habitname = updatedName;
  // Remove the type casting to String here
  await userHabitServices.updateUserHabit(widget.index, updatedHabit as String);
  setState(() {});
}
  void saveChanges() async {
    // await
    updateChanges();
    Navigator.of(context).pop(updatedHabit);
  }
}