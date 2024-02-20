// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';
import 'package:habit_hub/screens/calenderproperties/button/button.dart';
import 'package:habit_hub/screens/calenderproperties/calender/calenderforhome.dart';
import 'package:habit_hub/screens/add_habits/habit_add.dart';
import 'package:habit_hub/screens/add_habits/homescreenlistview.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:habit_hub/widgets/introcontainer.dart';

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
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: CustomCalender(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CalenderButton(),
            ),
            const SizedBox(height: 20),
            const IntroContainerScreen(
              progressValue: 60,
            ),
            const SizedBox(height: 20),
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: HomeScreenListview(
                  habitNames: habitlists,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: FloatingActionButton(
                backgroundColor: blue,
                hoverColor: yellow,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewHabit(addItem: _addHabit),
                  ));
                },
                heroTag: 'speed-dial-hero-tag',
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
