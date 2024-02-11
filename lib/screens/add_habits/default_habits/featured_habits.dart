import 'package:flutter/material.dart';
import 'package:habit_hub/screens/add_habits/default_habits/detailed_view.dart';
import 'package:like_button/like_button.dart';

class FeaturedHabits extends StatelessWidget {
  FeaturedHabits({super.key});

  final items = <Items>[
    Items(
      habitsname: 'Running',
      images: 'assets/images/runningorg.jpg',
      discription:
          'Running is a form of locomotion that involves rapid, coordinated movement of the legs to propel the body forward.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle. ',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Yoga',
      images: 'assets/images/yogaog.png',
      discription:
          'Yoga is a transformative practice that harmonizes mind, body, and spirit through a blend of mindful movement, breath control, and meditation, fostering holistic well-being and inner peace.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle.',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Food',
      images: 'assets/images/diet.jpg',
      discription:
          'Calisthenics is a form of exercise that involves using ones own body weight for resistance in various movements and positions.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle. ',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Calisthenics',
      images: 'assets/images/calisthenics.jpg',
      discription:
          'Calisthenics is a form of exercise that involves using ones own body weight for resistance in various movements and positions.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle. ',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Meditation',
      images: 'assets/images/meditationorg.jpg',
      discription:
          'Meditation is the art of cultivating inner peace and mindfulness, providing a sanctuary for the mind to find clarity and serenity amidst life demands.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle.',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Journel',
      images: 'assets/images/journal.jpg',
      discription:
          'A journal is a captivating voyage into the realms of introspection and self-discovery, where the inked expressions of ones thoughts and experiences illuminate the pages with the tapestry of personal growth.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle.',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Fasting',
      images: 'assets/images/fastignog.png',
      discription:
          'Intermittent fasting, a time-restricted eating pattern, optimizes health by cycling between periods of eating and fasting, promoting metabolic efficiency and potential weight management benefits.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle.',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Screen time',
      images: 'assets/images/screentime.jpg',
      discription:
          'Block screen time empowers users to regain control of their digital habits by limiting and managing their device usage, fostering a healthier balance between technology and personal well-being.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle.',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Personal booster',
      images: 'assets/images/confidence.png',
      discription:
          'Experience a personalized booster that unlocks your full potential and propels you towards peak performance in every aspect of your life.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle.',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
    Items(
      habitsname: 'Sugar free',
      images: 'assets/images/sugar.jpg',
      discription:
          'Effective sugar control is the key to maintaining stable blood glucose levels, promoting overall health and well-being.Routines offer a sense of control, accomplishment, and balance, fostering personal growth, better relationships, and a fulfilling lifestyle.',
      keyResults: [
        'Reduces stress and anxiety',
        'Improves flexibility, strength, and balance',
        'Enhances mental clarity and focus',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedViewScreen(
                      imagePath: items[index].images,
                      heroTag: 'heroTagForImage$index',
                      habitsName: items[index].habitsname,
                      discription: items[index].discription,
                      keyResults: items[index].keyResults,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF1F3FA),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildImage(
                      items[index].images,
                      MediaQuery.of(context).size.width * 0.30,
                      MediaQuery.of(context).size.width * 0.20,
                      15,
                      'heroTagForImage$index',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].habitsname,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: const Color(0xFF003A4D),
                            ),
                          ),
                          const Text(
                            'With Racheal Wisdom',
                            style: TextStyle(
                              color: Color(0xFF004D66),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.03),
                        child:
                            const LikeButton()), // change to LIKEBUTTONSCREEN
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildImage(String imagePath, double containerWidth,
      double containerHeight, double borderRadius, String heroTag) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Hero(
        tag: heroTag,
        child: Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Items {
  String habitsname;
  String images;
  String discription;
  List<String> keyResults;

  Items({
    required this.habitsname,
    required this.images,
    required this.discription,
    required this.keyResults,
  });
}
