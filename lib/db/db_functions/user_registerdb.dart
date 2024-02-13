// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_print
import 'package:habit_hub/db/models/Register/user_registermodel.dart';
import 'package:hive/hive.dart';

class UserRegisterDetails {
  final Box<UserRegisterModel> _registerBox =
      Hive.box<UserRegisterModel>('UserRegister');
  void SaveUserRegister(UserRegisterModel value) async {
    _registerBox.add(value);
  }
  List <UserRegisterModel> getDetails() {
    return _registerBox.values.toList();
  }

   Future<void> editUserRegister(int index, UserRegisterModel value) async {
    await _registerBox.putAt(index, value);
  }
}
