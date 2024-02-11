import 'package:flutter/material.dart';
import 'package:habit_hub/Themes/colors.dart';
import 'package:habit_hub/db/db_functions/user_habits_db.dart';
import 'package:habit_hub/db/models/habit/user_habit.dart';

class BottomSearch extends StatefulWidget {
  const BottomSearch({super.key});

  @override
  State<BottomSearch> createState() => _BottomSearchState();
}

class _BottomSearchState extends State<BottomSearch> {
  final TextEditingController _searchController = TextEditingController();
  final UserHabitServices _habitServices = UserHabitServices();

  List<HabitModel> allHabits = [];
  List<HabitModel> filterHabits = [];

  @override
  void initState() {
    super.initState();
    allHabits = _habitServices.getUserHabit();
    filterHabits = allHabits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true, toolbarHeight: 100,
      //   elevation: 0,
      //   // title:const Text('search'),
      // ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                onChanged: (value) => search(value),
                controller: _searchController,
                decoration: InputDecoration(
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.search,
                      color: primary,
                    ),
                  ),
                  labelText: 'Find here ...',
                  labelStyle: const TextStyle(color: primary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: filterHabits.isEmpty
                    ? const Center(
                        child: Text(
                          'Habit not found in the Database!',
                          style: TextStyle(
                              fontSize: 30,
                              color: red,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filterHabits.length,
                        itemBuilder: (context, index) {
                          final habit = filterHabits[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  habit.habitname!,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          );
                        },
                      ))
          ],
        )),
      ),
    );
  }

  void search(String searchterm) {
    setState(() {
      searchterm = searchterm.trim();
      filterHabits = allHabits
          .where((element) =>
              element.habitname
                  ?.toLowerCase()
                  .contains(searchterm.toLowerCase()) ??
              false)
          .toList();
    });
  }
}
