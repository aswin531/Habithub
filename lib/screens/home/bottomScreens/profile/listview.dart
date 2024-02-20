import 'package:flutter/material.dart';
import 'package:habit_hub/db/db_functions/user_registerdb.dart';
import 'package:habit_hub/db/models/Register/user_registermodel.dart';
import 'package:habit_hub/screens/home/bottomScreens/profile/editprofile.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  UserRegisterDetails userRegisterDetails = UserRegisterDetails();
  late List<UserRegisterModel> userDetails;

  @override
  void initState() {
    super.initState();
    userDetails = userRegisterDetails.getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: <Widget>[
            SizedBox(
                width: double.infinity,
                child: Image.asset('assets/images/profpage.png')),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: TextFormField(
                  initialValue:
                      userDetails.isNotEmpty ? userDetails[0].username : '',
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: TextFormField(
                  initialValue:
                      userDetails.isNotEmpty ? userDetails[0].email : '',
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: TextFormField(
                  initialValue: userDetails.isNotEmpty
                      ? userDetails[0].age.toString()
                      : '',
                  decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: TextFormField(
                  initialValue: userDetails.isNotEmpty
                      ? userDetails[0].height.toString()
                      : '',
                  decoration: InputDecoration(
                      labelText: 'Height',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditProfileScreen(userDetails: userDetails),
                      ));
                    },
                    icon: const Icon(Icons.edit)))
          ],
        ),
      ),
    );
  }
}
