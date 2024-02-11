import 'package:flutter/material.dart';
import 'package:habit_hub/screens/add_habits/default_habits/time/listwheel/ampm.dart';
import 'package:habit_hub/screens/add_habits/default_habits/time/listwheel/hours.dart';
import 'package:habit_hub/screens/add_habits/default_habits/time/listwheel/minutes.dart';
import 'package:habit_hub/themes/colors.dart';

class TimeListWheelScreen extends StatefulWidget {
  const TimeListWheelScreen({super.key});

  @override
  State<TimeListWheelScreen> createState() => _TimeListWheelScreenState();
}

class _TimeListWheelScreenState extends State<TimeListWheelScreen> {
//   late int _selectedHour;
//   late int _selectedMinute;

//   @override
//   void initState() {
//     super.initState();
//     _selectedHour = 0;
//     _selectedMinute = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Time Picker'),
//         // actions: [
//         //   IconButton(
//         //     icon: Icon(Icons.save),
//         //     onPressed: _saveTime,
//         //   ),
//         // ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildWheel(_hoursList(), (value) {
//                 setState(() {
//                   _selectedHour = value;
//                 });
//               }),
//               _buildWheel(_minutesList(), (value) {
//                 setState(() {
//                   _selectedMinute = value;
//                 });
//               }),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildWheel(List<Widget> items, ValueChanged<int> onChanged) {
//     return Container(
//       height: 150,
//       width: 100,
//       child: ListWheelScrollView(
//         itemExtent: 30,
//         physics: FixedExtentScrollPhysics(),
//         children: items,
//         onSelectedItemChanged: (index) {
//           onChanged(index);
//         },
//       ),
//     );
//   }

//   List<Widget> _hoursList() {
//     return List<Widget>.generate(24, (index) {
//       return Text('${index.toString().padLeft(2, '0')}');
//     });
//   }

//   List<Widget> _minutesList() {
//     return List<Widget>.generate(60, (index) {
//       return Text('${index.toString().padLeft(2, '0')}');
//     });
//   }

//   // void _saveTime() async {
//   //   var box = await Hive.openBox<TimeModel>('times');
//   //   await box.add(TimeModel(_selectedHour, _selectedMinute));
//   //   Navigator.of(context).pop();
//   // }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
                itemExtent: 70,
                perspective: 0.01,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 13,
                    builder: (context, index) {
                      return Myhours(
                        hours: index,
                      );
                    })),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
                itemExtent: 70,
                perspective: 0.01,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) {
                      return MyMinutes(
                        mins: index,
                      );
                    })),
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 70,
            child: ListWheelScrollView.useDelegate(
                itemExtent: 70,
                perspective: 0.010,
                diameterRatio: 1.1,
                physics: const FixedExtentScrollPhysics(),
                childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 2,
                    builder: (context, index) {
                      if (index == 0) {
                        return const AmPmScreen(
                          isAm: true,
                        );
                      } else {
                        return const AmPmScreen(isAm: false);
                      }
                    })),
          ),
        ],
      ),
    );
  }
}
