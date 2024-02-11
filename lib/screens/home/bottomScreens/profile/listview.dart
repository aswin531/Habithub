import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
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
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)))
          ],
        ),
      ),
    );
  }
}
// const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color:grey,
            //   ),
            //   child: Center(
            //     child: Text(
            //       'Aswin',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 24,
            //       ),
            //     ),
            //   ),
            // ),