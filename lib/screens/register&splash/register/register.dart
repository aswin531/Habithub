// ignore: avoid_web_libraries_in_flutter

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_registerdb.dart';
import 'package:habit_hub/db/models/Register/user_registermodel.dart';
import 'package:habit_hub/screens/home/mainscreen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/regbk.png'),
                Image.asset('assets/images/registerog.png'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 10),
                  onPressed: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      // anchorPoint: Offset(5, 5),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: primary,
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  style: const TextStyle(color: white),
                                  controller: nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: white,
                                    ),
                                    labelText: 'Name',
                                    labelStyle: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  style: const TextStyle(color: white),
                                  controller: ageController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.calendarWeek,
                                      color: white,
                                    ),
                                    labelText: 'Age',
                                    labelStyle: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  style: const TextStyle(color: white),
                                  controller: heightController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.height_rounded,
                                      color: white,
                                    ),
                                    labelText: 'Height',
                                    labelStyle: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  style: const TextStyle(color: white),
                                  controller: mailController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.squareEnvelope,
                                      color: white,
                                    ),
                                    labelText: 'Email',
                                    labelStyle: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primary,
                                        // minimumSize:const Size(100, 36),
                                      ),
                                      onPressed: () {
                                        if (nameController.text.isEmpty ||
                                            ageController.text.isEmpty ||
                                            heightController.text.isEmpty ||
                                            mailController.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            duration:
                                                const Duration(seconds: 3),
                                            content: Stack(
                                              children: [
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    height: 90,
                                                    decoration: const BoxDecoration(
                                                        color: red,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: const Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 48,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Oh snap!',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: white),
                                                            ),
                                                            Text(
                                                              'Fill all fields',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                                // ignore: deprecated_member_use
                                                Positioned(
                                                    bottom: 0,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        // ignore: deprecated_member_use
                                                        child:
                                                            SvgPicture.network(
                                                          'https://www.freepik.com/free-vector/realistic-neon-lights-background_13264408.htm#query=svg%20background&position=1&from_view=keyword&track=ais&uuid=af533bce-38ce-4f18-b938-257cb80df29d',
                                                          height: 48,
                                                          width: 40,
                                                          // ignore: deprecated_member_use
                                                          color: red,
                                                        )))
                                              ],
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: transparent,
                                            elevation: 0,
                                          ));
                                        } else {
                                          SavedUsername();
                                          register();
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenHome(),
                                          ));
                                        }
                                      },
                                      child: const Text(
                                        'REGISTER',
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Your Journey Starts Here',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> SavedUsername() async {
    // ignore: avoid_print
    // print(nameController.text);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('_keyUserName', nameController.text);
  }

  Future<void> register() async {
    final _username = nameController.text.trim();
    final _age = ageController.text.trim();
    final _height = heightController.text.trim();
    final _mail = mailController.text.trim();
    final register = UserRegisterModel(
        username: _username, age: _age, height: _height, email: _mail);
    SaveUserRegister(register);
  }
}
