import 'package:flutter/material.dart';
import 'package:habit_hub/Screens/bording%20Screens/screen1.dart';
import 'package:habit_hub/Screens/bording%20Screens/screen2.dart';
import 'package:habit_hub/Screens/bording%20Screens/screen3.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/screens/register&splash/register/register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _pageController = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [ScreenOne(), ScreenTwo(), ScreenThree()]),
          // SizedBox(
          //   height: 20,
          // ),
          Container(
              alignment: const Alignment(0, 0.90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: primary),
                    ),
                    onTap: () {
                      _pageController.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(controller: _pageController, count: 3),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return ScreenRegister();
                              },
                            ));
                          },
                          child: const Text(
                            'Done',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: primary),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: primary),
                          ),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
