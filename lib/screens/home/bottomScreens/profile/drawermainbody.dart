import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/syncfusion.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/syncfusionfiechart.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/syncfusionguage.dart';
import 'package:habit_hub/styles/thememodes/themeservices.dart';

class DrawerProfileBody extends StatefulWidget {
  const DrawerProfileBody({super.key});

  @override
  State<DrawerProfileBody> createState() => _DrawerProfileBodyState();
}

class _DrawerProfileBodyState extends State<DrawerProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            childAspectRatio: 1,
            mainAxisSpacing: 5),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  // if (icons[index] == Icons.dark_mode) {
                  ThemeServices().switchTheme();
                  // }
                  break;
                case 1:
                  break;
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SyncFusionChart()));
                  break;
                case 3:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SyncFusionScreen()));
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SyncFusionGuage()),
                  );
                  break;
                case 5:
                  // Function
                  break;
              }
            },
            child: Card(
              elevation: 10,
              color: colors[index],
              child: Icon(
                icons[index],
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }

  final colors = [
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.teal,
    Colors.pink,
    Colors.lime,
  ];
  final icons = [
    Icons.dark_mode,
    Icons.account_circle_rounded,
    FontAwesomeIcons.spinner,
    Icons.leaderboard,
    Icons.access_alarm,
    Icons.star,
  ];
}
