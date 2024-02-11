import 'package:hive/hive.dart';
part 'user_registermodel.g.dart';
@HiveType(typeId: 1)
class UserRegisterModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? age;
  @HiveField(3)
  String? height;
  @HiveField(4)
  String? email;

  UserRegisterModel({
    this.id,
    required this.username,
    required this.age,
    required this.height,
    required this.email,
  });
}
