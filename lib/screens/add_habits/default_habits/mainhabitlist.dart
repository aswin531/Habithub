import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/screens/add_habits/default_habits/habitsintrend/mainscreen.dart';

class MainHabitsList extends StatelessWidget {
  MainHabitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 440,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF1F3FA)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        icons[index],
                        size: 30,
                        color: colors[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titles[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF003A4D)),
                          ),
                          Text(
                            subtitles[index],
                            style: const TextStyle(
                              color: Color(0xFF004D66),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HabitsInTrend(),
                          ));
                        },
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 40,
                          color: black,
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  final titles = [
    'Habits In Trend',
    'Essential Habits',
    'Eat&Drink Healthily',
    'Ease Stress',
    'Budget Money',
    'Explore Yourself',
    'Sleep Routine',
    'Tidy Life',
    'Leisure moments'
  ];

  final subtitles = [
    'Keep up the pace with the world',
    'Refresh your life with simple acts',
    'Stay healthy with daily intakes',
    'Your efforts deserves a break',
    'Financial wellness made simple',
    'Discover your inner unknowns',
    'May your dream be sweet tonight',
    'Everything has its own place',
    'Live your life to the max'
  ];

  final icons = [
    Icons.thumb_up,
    FontAwesomeIcons.clipboardCheck,
    FontAwesomeIcons.apple,
    FontAwesomeIcons.faceSmile,
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.peopleGroup,
    FontAwesomeIcons.moon,
    FontAwesomeIcons.broom,
    FontAwesomeIcons.gamepad,
  ];

  final colors = [
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.teal,
    Colors.pink,
    Colors.lime,
    Colors.black,
    Colors.brown,
    Colors.indigo,
  ];
}
