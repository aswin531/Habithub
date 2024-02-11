// import 'package:flutter/material.dart';

// class BottomProfile extends StatefulWidget {
//   const BottomProfile({super.key});

//   @override
//   State<BottomProfile> createState() => _BottomProfileState();
// }

// class _BottomProfileState extends State<BottomProfile> {
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         // body: SafeArea(
//         //   child: Column(
//         //     children: [
//         //       Row(
//         //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //         children: [
//         //           Container(
//         //             width: MediaQuery.of(context).size.width * 0.3,
//         //             height: MediaQuery.of(context).size.width * 0.45,
//         //             decoration: const BoxDecoration(
//         //               color: primary,
//         //               borderRadius:
//         //                   BorderRadius.only(bottomRight: Radius.circular(50)),
//         //             ),
//         //           ),
//         //           Stack(
//         //             children: [
//         //               Container(
//         //                 width: MediaQuery.of(context).size.width * 0.32,
//         //                 height: MediaQuery.of(context).size.width * 0.45,
//         //                 decoration: const BoxDecoration(
//         //                   color: primary,
//         //                   borderRadius: BorderRadius.only(
//         //                     bottomRight: Radius.circular(55),
//         //                     bottomLeft: Radius.circular(55),
//         //                   ),
//         //                 ),
//         //               ),
//         //               Positioned(
//         //                 bottom: -25,
//         //                 left: 0,
//         //                 right: 0,
//         //                 child: ClipOval(
//         //                   child: Container(
//         //                     decoration: const BoxDecoration(
//         //                       color: Colors.white,
//         //                       borderRadius: BorderRadius.all(Radius.circular(30)),
//         //                     ),
//         //                     width: MediaQuery.of(context).size.width * 0.2,
//         //                     height: MediaQuery.of(context).size.width * 0.3,
//         //                     child: Image.asset('assets/images/profiledd.png'),
//         //                   ),
//         //                 ),
//         //               ),
//         //             ],
//         //           ),
//         //           Container(
//         //             width: MediaQuery.of(context).size.width * 0.3,
//         //             height: MediaQuery.of(context).size.width * 0.45,
//         //             decoration: const BoxDecoration(
//         //               color: primary,
//         //               borderRadius: BorderRadius.only(
//         //                 bottomRight: Radius.circular(0),
//         //                 bottomLeft: Radius.circular(50),
//         //               ),
//         //             ),
//         //           ),
//         //         ],
//         //       ),
//         //       SizedBox(
//         //         height: MediaQuery.of(context).size.height * 0.02,
//         //       ),
//         //       Padding(
//         //         padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
//         //         child: Column(
//         //           mainAxisAlignment: MainAxisAlignment.center,
//         //           children: [
//         //             Padding(
//         //               padding: EdgeInsets.all(
//         //                   MediaQuery.of(context).size.width * 0.01),
//         //               child: Text(
//         //                 'John Duo',
//         //                 style: TextStyle(
//         //                     fontSize: MediaQuery.of(context).size.width * 0.06,
//         //                     fontWeight: FontWeight.w600),
//         //               ),
//         //             ),
//         //             Padding(
//         //               padding: EdgeInsets.all(
//         //                   MediaQuery.of(context).size.width * 0.01),
//         //               child: ElevatedButton(
//         //                 style: ElevatedButton.styleFrom(
//         //                   elevation: 5,
//         //                   backgroundColor: yellow,
//         //                   shape: const StadiumBorder(),
//         //                 ),
//         //                 onPressed: () {
//         //                   Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //                     builder: (context) => const EditProfileScreen(),
//         //                   ));
//         //                 },
//         //                 child: Text(
//         //                   'Edit Profile',
//         //                   style: TextStyle(
//         //                       fontSize: MediaQuery.of(context).size.width * 0.025,
//         //                       color: black),
//         //                 ),
//         //               ),
//         //             ),
//         //           ],
//         //         ),
//         //       ),
//         //       SizedBox(
//         //         height: MediaQuery.of(context).size.height * 0.1,
//         //       ),
//         //       Expanded(
//         //         child: Padding(
//         //           padding: EdgeInsets.all(
//         //             MediaQuery.of(context).size.width * 0.02,
//         //           ),
//         //           child: ListView.builder(
//         //             itemBuilder: (context, index) {
//         //               return Padding(
//         //                 padding: EdgeInsets.all(
//         //                   MediaQuery.of(context).size.width * 0.01,
//         //                 ),
//         //                 child: ListTile(
//         //                   onTap: () {
//         //                     if (index == details.length - 1) {
//         //                       Navigator.push(
//         //                         context,
//         //                         MaterialPageRoute(
//         //                           builder: (context) =>
//         //                               const PersonalProfileScreen(),
//         //                         ),
//         //                       );
//         //                     }
//         //                   },
//         //                   trailing: (index == details.length - 2)
//         //                       ? Padding(
//         //                           padding: EdgeInsets.only(
//         //                             top:
//         //                                 MediaQuery.of(context).size.width * 0.025,
//         //                           ),
//         //                           child: GestureDetector(
//         //                             child: IconButton(
//         //                               onPressed: () {
//         //                                 setState(() {
//         //                                   ThemeServices().switchTheme();
//         //                                 });
//         //                               },
//         //                               icon: Container(
//         //                                 decoration: const BoxDecoration(
//         //                                   shape: BoxShape.circle,
//         //                                   color: white,
//         //                                 ),
//         //                                 child: Icon(
//         //                                   Get.isDarkMode
//         //                                       ? Icons.nightlight_round_outlined
//         //                                       : Icons.sunny,
//         //                                   color: Get.isDarkMode
//         //                                       ? Colors.white
//         //                                       : Colors.black,
//         //                                   size:
//         //                                       MediaQuery.of(context).size.width *
//         //                                           0.06,
//         //                                 ),
//         //                               ),
//         //                             ),
//         //                           ),
//         //                         )
//         //                       : Padding(
//         //                           padding: EdgeInsets.only(
//         //                             top:
//         //                                 MediaQuery.of(context).size.width * 0.025,
//         //                           ),
//         //                           child: GestureDetector(
//         //                             child: IconButton(
//         //                               onPressed: () {
//         //                                 if (index == details.length - 1) {
//         //                                   Navigator.push(
//         //                                     context,
//         //                                     MaterialPageRoute(
//         //                                       builder: (context) =>
//         //                                           const PersonalProfileScreen(),
//         //                                     ),
//         //                                   );
//         //                                 }
//         //                               },
//         //                               icon: Icon(
//         //                                 Icons.arrow_forward_ios_outlined,
//         //                                 color: grey,
//         //                                 size: MediaQuery.of(context).size.width *
//         //                                     0.06,
//         //                               ),
//         //                             ),
//         //                           ),
//         //                         ),
//         //                   leading: GestureDetector(
//         //                     child: IconButton(
//         //                       onPressed: () {},
//         //                       icon: icons[index],
//         //                       iconSize: 35,
//         //                       color: yellow,
//         //                     ),
//         //                   ),
//         //                   title: SizedBox(
//         //                     width: MediaQuery.of(context).size.width * 0.6,
//         //                     child: Padding(
//         //                       padding: EdgeInsets.all(
//         //                         MediaQuery.of(context).size.width * 0.01,
//         //                       ),
//         //                       child: Text(
//         //                         details[index],
//         //                         style: TextStyle(
//         //                           fontWeight: FontWeight.w700,
//         //                           fontSize:
//         //                               MediaQuery.of(context).size.width * 0.058,
//         //                         ),
//         //                         overflow: TextOverflow.ellipsis,
//         //                       ),
//         //                     ),
//         //                   ),
//         //                 ),
//         //               );
//         //             },
//         //             itemCount: details.length,
//         //           ),
//         //         ),
//         //       )
//         //     ],
//         //   ),
//         // ),
//         );
//   }

//   // final details = [
//   //   'Notifications',
//   //   'Rate us',
//   //   'Feedback',
//   //   'Theme',
//   //   'Personal Details',
//   // ];

//   // final icons = const [
//   //   Icon(FontAwesomeIcons.bell),
//   //   Icon(FontAwesomeIcons.star),
//   //   Icon(FontAwesomeIcons.message),
//   //   Icon(Icons.light),
//   //   Icon(FontAwesomeIcons.user),
//   // ];
// }
