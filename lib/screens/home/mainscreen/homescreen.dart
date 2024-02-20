import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/screens/home/bottomScreens/categories.dart';
import 'package:habit_hub/screens/home/bottomScreens/favourites/favourite.dart';
import 'package:habit_hub/screens/home/bottomScreens/home.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/drawerprofile.dart';
import 'package:habit_hub/screens/home/bottomScreens/search.dart';
import 'package:habit_hub/themes/colors.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int index = 0;

  final screens = [
    const BottomHome(),
    const BottomSearch(),
    const BottomFavourite(),
    const BottomCategories(),
    const BottomProfile()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.home,
        size: 25,
      ),
      const Icon(
        Icons.search,
        size: 25,
      ),
      const Icon(
        FontAwesomeIcons.heart,
        size: 25,
      ),
      const Icon(
        FontAwesomeIcons.layerGroup,
        size: 25,
      ),
      const Icon(
        Icons.person,
        size: 25,
      ),
    ];
    return Scaffold(
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: blue)),
          child: CurvedNavigationBar(
            color: black,
            backgroundColor: Colors.transparent,
            height: 50,
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 200),
            index: index,
            items: items,
            onTap: (index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ));
  }
}
