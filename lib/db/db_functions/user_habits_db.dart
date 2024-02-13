import 'package:habit_hub/db/models/habit/user_habit.dart';
import 'package:hive/hive.dart';

class UserHabitServices {
  final Box<HabitModel> _userhabitBox = Hive.box<HabitModel>('userhabits');

  Future<void> addUserhabit(String habitname, String date) async {
    final newhabit = HabitModel(habitname: habitname, date: date);
    await _userhabitBox.add(newhabit);
  }

  List<HabitModel> getUserHabit() {
    return _userhabitBox.values.toList();
  }

  Future<void> updateUserHabit(int index, String updatedName) async {
    final userhabit = _userhabitBox.getAt(index);
    if (userhabit != null) {
      userhabit.habitname = updatedName;
      await _userhabitBox.putAt(index, userhabit);
    }
  }

  Future<void> deleteUserHabit(int index) async {
    await _userhabitBox.deleteAt(index);
  }
}
