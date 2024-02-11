import 'package:flutter/material.dart';
import 'package:habit_hub/screens/home/bottomScreens/favourites/insidefavourites.dart';

class BottomFavourite extends StatelessWidget {
  const BottomFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: grey,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favourites',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text('Curate, Cultivate, Conquer Habits!')
          ],
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FavouriteHabits(),
        ),
        //  child: Container(width: double.infinity,
        //     height: double.infinity,
        //   color: grey,
        //   child:const Text('Category Page')),
      ),
    );
  }
}
