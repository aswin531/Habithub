import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/drawermainbody.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/listview.dart';
import 'package:habit_hub/themes/colors.dart';

class BottomProfile extends StatelessWidget {
  const BottomProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: white,
          // backgroundColor: Colors.grey[350],
          width: MediaQuery.of(context).size.width * 0.7000,
          child: const ListViewScreen()),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DashBoard',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: FaIcon(FontAwesomeIcons.circleUser),
                ),
                iconSize: 40,
                color: blue,
              );
            }),
          ),
        ],
      ),
      body: const Center(child: DrawerProfileBody()),
    );
  }
}
