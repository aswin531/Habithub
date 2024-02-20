import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';
import 'package:habit_hub/global.dart';
import 'package:habit_hub/notifications/notifications.dart';
import 'package:habit_hub/screens/add_habits/default_habits/mainhabitlist.dart';
import 'package:habit_hub/screens/add_habits/reminder_container.dart';
import 'package:habit_hub/screens/add_habits/goal_tile.dart';
import 'package:habit_hub/screens/home/mainscreen/homescreen.dart';

class AddNewHabit extends StatefulWidget {
  final Function(String) addItem;
  const AddNewHabit({
    super.key,
    required this.addItem,
  });

  @override
  State<AddNewHabit> createState() => _AddNewHabitState();
}

class _AddNewHabitState extends State<AddNewHabit> {
  TimeOfDay? selectedTime;
  TextEditingController userhabitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 20,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userhabitController,
                  decoration: const InputDecoration(
                    labelText: 'Habit name ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const GoalSettingDrop(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose from ours',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.grey[400] : black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainHabitsList(),
                          ));
                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(color: primary, fontSize: 17),
                        ))
                  ],
                ),
              ),
              Container(
                  decoration: const BoxDecoration(),
                  width: double.infinity,
                  height: 425,
                  child: MainHabitsList()),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ReminderContainerScreen(
                  onTimeSelected: (selectedTime) {
                    setState(() {
                      this.selectedTime = selectedTime;
                    });
                  },
                ),
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
                    String habitname = userhabitController.text;
                    if (habitname.isNotEmpty) {
                      LocalNotification.ShowNotifications(
                          title: 'Habit saved',
                          body:
                              ' Your habit "$habitname" has been saved succesfully',
                          payload: "Saved Successfully");
                      String formattedTime = selectedTime != null
                          ? '${selectedTime!.hour}:${selectedTime!.minute}'
                          : ''; // Format the time as desired for your database
                      UserHabitServices userHabitServices = UserHabitServices();
                      await userHabitServices.addUserhabit(
                        habitname,
                        DateTime.now().toString(),
                        formattedTime,
                      );
                      habitList.add(habitname);
                      widget.addItem(habitname);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const ScreenHome(),
                        ),
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: red,
                          content: Text(
                            'Cant save an empty habit !',
                            style: TextStyle(color: white),
                          )));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
