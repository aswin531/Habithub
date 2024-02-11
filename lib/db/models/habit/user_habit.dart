import 'package:hive/hive.dart';

part 'user_habit.g.dart';

@HiveType(typeId: 0)
class HabitModel {
  @HiveField(0)
  String? habitname;
  @HiveField(1)
  String? date;

  HabitModel({required this.habitname, required this.date});
  
}
