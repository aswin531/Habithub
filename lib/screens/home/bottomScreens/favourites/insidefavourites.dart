import 'package:flutter/material.dart';
import 'package:habit_hub/db/db_functions/user_favourites.dart';
import 'package:habit_hub/db/models/habit/user_habit.dart';
import 'package:habit_hub/screens/home/bottomScreens/favourites/insidescreen.dart';
import 'package:habit_hub/themes/colors.dart';

class FavouriteHabits extends StatefulWidget {
  const FavouriteHabits({Key? key}) : super(key: key);

  @override
  State<FavouriteHabits> createState() => _FavouriteHabitsState();
}

class _FavouriteHabitsState extends State<FavouriteHabits> {
  final UserFavouritesServices _favouriteServices = UserFavouritesServices();

  @override
  Widget build(BuildContext context) {
    // int crossAxisCount = MediaQuery.of(context).size.width ~/ 200;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.9,
      ),
      itemCount: _favouriteServices.getFavourites().length,
      itemBuilder: (context, index) {
        HabitModel habit = _favouriteServices.getFavourites()[index];

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => InsideFavouritesScreen(habit: habit)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
                  surfaceTintColor: yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(

                      fit: StackFit.expand,
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.darken,
                          ),
                          child: Image.asset(
                            'assets/images/bgfavourites.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              // child: LikeButtonScreen(habitname: '', date: ''),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    habit.habitname ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

  // Widget buildImage(String imagePath, double containerWidth,
  //     double containerHeight, double borderRadius, String heroTag) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Hero(
  //       tag: heroTag,
  //       child: Container(
  //         width: containerWidth,
  //         height: containerHeight,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(borderRadius),
  //         ),
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(borderRadius),
  //           child: Image.asset(
  //             imagePath,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }




//=============<<<<<  CARD VIEW >>>>>==============

// GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2, // You can adjust the number of columns here
//     crossAxisSpacing: 8.0,
//     mainAxisSpacing: 8.0,
//   ),
//   itemCount: 5,
//   itemBuilder: (context, index) {
//     return GestureDetector(
//       onTap: () {},
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         elevation: 4,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 100,
//               height: 50,
//               child: Image.asset('assets/images/logo2app.png'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'HI ADD IMAGE & TEXT HERE',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: MediaQuery.of(context).size.width * 0.05,
//                       color: const Color(0xFF003A4D),
//                     ),
//                   ),
//                   const Text(
//                     'With Racheal Wisdom',
//                     style: TextStyle(
//                       color: Color(0xFF004D66),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const LikeButtonScreen(),
//           ],
//         ),
//       ),
//     );
//   },
// );
