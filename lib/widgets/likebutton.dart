import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_favourites.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeButtonScreen extends StatefulWidget {
  final String habitname;
  final String date;

  const LikeButtonScreen({
    required this.habitname,
    required this.date,
    super.key,
  });

  @override
  State<LikeButtonScreen> createState() => _LikeButtonScreenState();
}

class _LikeButtonScreenState extends State<LikeButtonScreen> {
  late bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likedStatus();
  }

  // bool isLiked = false;
  int numberOfLikes = 120;
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      isLiked: isLiked,
      onTap: (bool currentIsLiked) async {
        setState(() {
          isLiked = !currentIsLiked;
          if (isLiked) {
            numberOfLikes += 1;
            UserFavouritesServices _favouriteServices =
                UserFavouritesServices();
            bool isAlreadyFavourite =
                _favouriteServices.isFavourite(widget.habitname, widget.date);
            if (!isAlreadyFavourite) {
              _favouriteServices.addFavourites(widget.habitname, widget.date);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Added to Favourites'),
                backgroundColor: blue,
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
              ));
            }
          } else {
            numberOfLikes -= 1;
            UserFavouritesServices _favouriteServices =
                UserFavouritesServices();
            _favouriteServices.deleteFavourites(widget.habitname, widget.date);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Removed from Favourites'),
              backgroundColor: red,
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ));
          }
        });
        return !currentIsLiked;
      },

      size: 40,
      countPostion: CountPostion.bottom,
      // likeCount: numberOfLikes,
    );
  }

  Future<void> likedStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked = prefs.getBool('${widget.habitname}_${widget.date}') ?? false;
    });
  }

  Future<void> saveLikeStatus(bool isLiked) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.habitname}_${widget.date}', isLiked);
  }
}
