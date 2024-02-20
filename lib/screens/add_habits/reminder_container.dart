import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/notifications/notifications.dart';
import 'package:habit_hub/screens/add_habits/default_habits/time/buttons/calenderbutton.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/screens/add_habits/default_habits/time/buttons/timebutton.dart';

class ReminderContainerScreen extends StatefulWidget {
  final void Function(TimeOfDay selectedTime) onTimeSelected;

  const ReminderContainerScreen({Key? key, required this.onTimeSelected})
      : super(key: key);
  @override
  State<ReminderContainerScreen> createState() =>
      _ReminderContainerScreenState();
}

class _ReminderContainerScreenState extends State<ReminderContainerScreen> {
  bool isSwitched = false;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            backgroundColor: black,
            collapsedIconColor: green,
            collapsedBackgroundColor: bluesgrey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            collapsedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            initiallyExpanded: false,
            iconColor: grey,
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
                      padding: const EdgeInsets.only(left: 100),
                      child: LiteRollingSwitch(
                        width: 110,
                        onTap: () {
                          LocalNotification.showPeriodicNotification(
                              title: "Reminder",
                              body: "This is a Repeated REminder Notifications",
                              payload: 'payload');
                        },
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
                        onDoubleTap: () {
                          LocalNotification.showPeriodicNotification(
                              title: "Reminder",
                              body: "This is a Repeated REminder Notifications",
                              payload: 'payload');
                        },
                        onSwipe: () {
                          LocalNotification.showPeriodicNotification(
                              title: "Reminder",
                              body: "This is a Repeated REminder Notifications",
                              payload: 'payload');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TimeButton(
                          onTimeSelected: (selectedTime) {
                            // ignore: avoid_print
                            print('Selected time: $selectedTime');
                            setState(() {
                              this.selectedTime = selectedTime;
                            });
                            widget.onTimeSelected(selectedTime);
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CalenderButtonScreen(
                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        onDateSelected: (DateTime) {},
                      ),
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
