import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/screens/add_habits/default_habits/time/buttons/calenderbutton.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/screens/add_habits/default_habits/time/buttons/timebutton.dart';

class ReminderContainerScreen extends StatefulWidget {
  const ReminderContainerScreen({Key? key}) : super(key: key);
  @override
  State<ReminderContainerScreen> createState() =>
      _ReminderContainerScreenState();
}

class _ReminderContainerScreenState extends State<ReminderContainerScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            title: const Text(
              'Additional Settings',
              style: TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Reminder',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: LiteRollingSwitch(
                        onTap: () {},
                        textOn: "Do",
                        textOff: 'Dont Do',
                        colorOn: Colors.green,
                        colorOff: Colors.redAccent,
                        iconOff: FontAwesomeIcons.lightbulb,
                        iconOn: FontAwesomeIcons.dumbbell,
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        onDoubleTap: () {},
                        onSwipe: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TimeButton(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CalenderButtonScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
