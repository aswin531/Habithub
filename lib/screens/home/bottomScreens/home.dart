// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';
import 'package:habit_hub/screens/calenderproperties/button/button.dart';
import 'package:habit_hub/screens/calenderproperties/calender/calenderforhome.dart';
import 'package:habit_hub/screens/add_habits/habit_add.dart';
import 'package:habit_hub/screens/add_habits/homescreenlistview.dart';

class BottomHome extends StatefulWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  List<String> habitlists = [];

  // ignore: unused_element
  void _addHabit(String habitName) {
    setState(() {
      habitlists.add(habitName);
      print('Ite, =>> $habitName');
    });
  }

  UserHabitServices userHabitServices = UserHabitServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 5,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomCalender(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CalenderButton(),
              ),
              const SizedBox(height: 10),
              // Expanded(
              //     child: Card(
              //         shape: ContinuousRectangleBorder(
              //             side: BorderSide(color: blue),
              //             borderRadius: BorderRadius.circular(20)),
              //         elevation: 5,
              //         child: SyncFusionChart())),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add a new one ',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddNewHabit(addItem: _addHabit),
                        ));
                      },
                      heroTag: 'speed-dial-hero-tag',
                      backgroundColor: primary,
                      child: const Icon(
                        Icons.add,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: HomeScreenListview(
                  habitNames: habitlists,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
