import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_registerdb.dart';
import 'package:habit_hub/db/models/Register/user_registermodel.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/editprofile.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PersonalProfileScreen extends StatefulWidget {
  const PersonalProfileScreen({super.key});

  @override
  State<PersonalProfileScreen> createState() => _PersonalProfileScreenState();
}

class _PersonalProfileScreenState extends State<PersonalProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: userListNotifier,
      builder:
          (BuildContext ctx, List<UserRegisterModel> userList, Widget? child) {
        return Scaffold(
          body: ValueListenableBuilder(
            valueListenable:
                Hive.box<UserRegisterModel>('userregister_db').listenable(),
            builder: (context, Box<UserRegisterModel> box, _) {
              if (box.isNotEmpty) {
                // Displaying  the user data
                UserRegisterModel userRegisterData = box.getAt(0)!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          height: 600,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: primary)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset(
                                      'assets/images/profiledd.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Username: ${userRegisterData.username}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Age: ${userRegisterData.age}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Height: ${userRegisterData.height}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Email: ${userRegisterData.email}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          backgroundColor: yellow,
                                          shape: const StadiumBorder()),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfileScreen(),
                                        ));
                                      },
                                      child: const Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                            fontSize: 17, color: black),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('No user register data found.'),
                );
              }
            },
          ),
        );
      },
    );
  }
}
