import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/defaulthabitsfunctions.dart';
import 'package:habit_hub/db/models/default/defaulthabitmodel.dart';
import 'package:habit_hub/global.dart';
import 'package:habit_hub/notifications/notifications.dart';
import 'package:habit_hub/screens/home/mainscreen/homescreen.dart';

class DetailedViewScreen extends StatelessWidget {
  final String imagePath;
  final String heroTag;
  final String habitsName;
  final String discription;
  final List<String> keyResults;

  // ignore: use_key_in_widget_constructors
  const DetailedViewScreen({
    required this.imagePath,
    required this.heroTag,
    required this.habitsName,
    required this.discription,
    required this.keyResults,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: heroTag,
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      habitsName,
                      style: const TextStyle(
                          color: white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: FaIcon(
                        FontAwesomeIcons.lightbulb,
                        color: yellow,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  discription,
                  style: const TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'KEY RESULTS: \n',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: grey,
                        ),
                        children: keyResults.map((result) {
                          return TextSpan(
                            text: '\n- $result\n',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: white,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  minimumSize: const Size(110, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: white,
                ),
                onPressed: () async {
                  await Notifications.showNotification(
                    'Habit Saved',
                    'Your habit "$habitsName" has been saved successfully.',
                  );

                  await _saveDefault();
                  habitList.add(habitsName);
                  // ignore: avoid_print
                  print(habitList.length);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ScreenHome(),
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _saveDefault() async {
    DefaulthabitServices defaulthabitServices = DefaulthabitServices();
    await defaulthabitServices.defualtBox.add(DefaultItems(
      description: discription,
      keyResults: keyResults,
      habitsname: habitsName,
      images: imagePath,
    ));
    // ignore: avoid_print
    print('Data saved to Hive');
  }
}
