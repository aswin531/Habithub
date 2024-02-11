import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';

class EditHabitScreen extends StatefulWidget {
  final String? habitName;
  final int index;
  const EditHabitScreen({super.key, this.habitName, required this.index});

  @override
  State<EditHabitScreen> createState() => _EditHabitScreenState();
}

class _EditHabitScreenState extends State<EditHabitScreen> {
  final TextEditingController _editingController = TextEditingController();
  late String updatedname;

  @override
  void initState() {
    super.initState();
    updatedname = widget.habitName ?? '';
    _editingController.text = updatedname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Edit',
          style: TextStyle(
              color: white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: primary,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _editingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                minimumSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: white,
              ),
              onPressed: () async {
               saveChanges();
                              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'SAVE',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, color: black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateChanges() async {
    updatedname = _editingController.text;
    await UserHabitServices().updateUserHabit(widget.index, updatedname);
    setState(() {
      updatedname = _editingController.text;
    });
  }

  void saveChanges() async {
   await updateChanges();
    setState(() {
      
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(updatedname);
  }
}
