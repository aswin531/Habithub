// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/global.dart';
import 'package:habit_hub/screens/edit_habits/edit_habit.dart';
import 'package:habit_hub/themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';
// ignore: unused_import
import 'package:habit_hub/widgets/likebutton.dart';

class HomeScreenListview extends StatefulWidget {
  final List<String> habitNames;

  const HomeScreenListview({
    super.key,
    required this.habitNames,
  });
  @override
  State<HomeScreenListview> createState() => _HomeScreenListviewState();
}

class _HomeScreenListviewState extends State<HomeScreenListview> {
  bool habitCompleted = false;
  void checkBox(bool? value) {
    setState(() {
      habitCompleted = value!;
    });
  }

  UserHabitServices userHabitServices = UserHabitServices();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: userHabitServices.getUserHabit().length,
        itemCount: habitList.length,
        itemBuilder: (BuildContext context, int index) {
          final userhabit = userHabitServices.getUserHabit()[index];
          return Builder(builder: (context) {
            return Dismissible(
              background: Container(
                decoration: const BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: const Icon(Icons.delete),
              ),
              key: ValueKey<int>(index),
              onDismissed: ((direction) {
                setState(() {
                  userHabitServices.deleteUserHabit(index);
                });
              }),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB0B5C1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                // habitList[index],
                                //  widget.habitNames[index],
                                userhabit.habitname ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                              Checkbox(
                                  value: habitCompleted,
                                  onChanged: (value) => checkBox(value)),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 5,
                          child: SpeedDial(
                            icon: FontAwesomeIcons.gear,
                            activeIcon: Icons.close,
                            visible: true,
                            closeManually: false,
                            renderOverlay: false,
                            curve: Curves.bounceIn,
                            overlayColor: Colors.black,
                            overlayOpacity: 0.5,
                            onOpen: () =>
                                print('Floating Action Button Opened'),
                            onClose: () =>
                                print('Floating Action Button Closed'),
                            tooltip: 'Speed Dial',
                            backgroundColor: primary,
                            foregroundColor: Colors.white,
                            elevation: 8.0,
                            children: [
                              SpeedDialChild(
                                child: const Icon(
                                  Icons.delete,
                                  color: red,
                                ),
                                labelStyle: const TextStyle(fontSize: 18.0),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: white,
                                        title: const Text(
                                          'Confirmation!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: const Text(
                                          'Do you want to delete ?',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      userHabitServices
                                                          .deleteUserHabit(
                                                              index);
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              SpeedDialChild(
                                  child: const Icon(
                                    Icons.edit,
                                    color: grey,
                                  ),
                                  labelStyle: const TextStyle(fontSize: 18.0),
                                  onTap: () async {
                                    final updatedHabitName =
                                        await Navigator.of(context)
                                            .push(MaterialPageRoute(
                                      builder: (context) => EditHabitScreen(
                                        habitName: userhabit.habitname,
                                        index: index,
                                      ),
                                    ));
                                    if (updatedHabitName != null) {
                                      setState(() {
                                        userhabit.habitname = updatedHabitName;
                                      });
                                    }
                                  }),
                              SpeedDialChild(
                                child: LikeButtonScreen(
                                  habitname: userhabit.habitname ?? ' ',
                                  date: userhabit.date ?? '',
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
