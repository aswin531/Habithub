// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:habit_hub/db/models/Register/user_registermodel.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<UserRegisterModel>> userListNotifier = ValueNotifier([]);

void SaveUserRegister(UserRegisterModel value) async {
  print(value.toString());
  final userregisterDb =
      await Hive.openBox<UserRegisterModel>('userregister_db');
  final _id = await userregisterDb.add(value);
  print('UserRegisterModel saved to Hive with ID: $_id');
  value.id = _id;
  userListNotifier.value.add(value);
}

// Future<Box<UserRegisterModel>?> getUserDetails() async {
//   final userregisterDb =
//       await Hive.openBox<UserRegisterModel>('userregister_db');
//   if (userregisterDb.isNotEmpty) {
//     // Retrieve the first user's data
//     // ignore: unused_local_variable
//     UserRegisterModel userRegisterData = userregisterDb.getAt(0)!;
//     return userregisterDb;
//   } else {
//     return null;
//   }
// }