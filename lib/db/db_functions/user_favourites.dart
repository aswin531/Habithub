// ignore_for_file: avoid_print

import 'package:habit_hub/db/models/habit/user_habit.dart';
import 'package:hive/hive.dart';

class UserFavouritesServices {
  final Box<HabitModel> _userFavouritesBox =
      Hive.box<HabitModel>('userfavourites');

      
      bool isFavourite(String habitname, String date) {
  for (int i = 0; i < _userFavouritesBox.length; i++) {
    HabitModel habit = _userFavouritesBox.getAt(i)!;
    if (habit.habitname == habitname && habit.date == date) {
      return true;
    }
  }
  return false;
}


  Future<void> addFavourites(String name, String date) async {
    final favhabit = HabitModel(habitname: name, date: date);
    await _userFavouritesBox.add(favhabit);
    print('Habit added to favorites: $name, $date');
  }

  List<HabitModel> getFavourites() {
    return _userFavouritesBox.values.toList();
  }

  // Future<void> updateFavourites(int inedex, String updatedname) async {
  //   final favouritehabit = _userFavouritesBox.getAt(index);
  //   if (favouritehabit != null) {
  //     favouritehabit.habitname = updatedname;
  //     await _userFavouritesBox.putAt(index, favouritehabit);
  //   }
  // }

  Future<void> deleteFavourites(String habitname, String date) async {
    int index = _findIndex(habitname, date);
    if (index != -1) {
      await _userFavouritesBox.deleteAt(index);
          print('Habit removed to favorites: $date');

    }
  }

  int _findIndex(String habitname, String date) {
    for (int i = 0; i < _userFavouritesBox.length; i++) {
      HabitModel habit = _userFavouritesBox.getAt(i)!;
      if (habit.habitname == habitname && habit.date == date) {
        return i;
      }
    }
    return -1;
  }
}
