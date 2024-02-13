import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/models/Register/user_registermodel.dart';

class EditProfileScreen extends StatefulWidget {
   final List<UserRegisterModel> userDetails;
  const EditProfileScreen({
    super.key, required this.userDetails,
  });
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/profiledd.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person_2,
                    color: black,
                  ),
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.w700,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: ageController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                    color: black,
                  ),
                  labelText: 'Age',
                  labelStyle: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.w700,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                style: const TextStyle(color: black),
                controller: heightController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.height_rounded,
                    color: black,
                  ),
                  labelText: 'Height',
                  labelStyle: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.w700,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                style: const TextStyle(color: black),
                controller: mailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.mail_sharp,
                    color: black,
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: black,
                    fontWeight: FontWeight.w700,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('SAVE'))
          ],
        ),
      )),
    );
  }
}
