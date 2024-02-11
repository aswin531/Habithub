import 'package:flutter/material.dart';
import 'package:habit_hub/Screens/bording%20Screens/onbording_screens.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/screens/home/mainscreen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    checkSavedUserName(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Container(
    decoration: const BoxDecoration(
      color: primary,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Replace SizedBox with Flexible to make the image responsive
          Flexible(
            flex: 1,
            child: Image.asset('assets/images/splashimg.png'),
          ),
          const SizedBox(height: 20), // Add some spacing between the image and text
          const Text(
            'Habit Hub',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          )
        ],
      ),
    ),
  ),
);
  }
}

Future<void> checkSavedUserName(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final savedName = prefs.getString('_keyUserName');
  if (savedName != null) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ScreenHome(),
    ));
  } else {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const OnBordingScreen(),
      ));
    });
  }
}
