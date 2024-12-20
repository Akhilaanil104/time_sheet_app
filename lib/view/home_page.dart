// // // // // // import 'package:flutter/material.dart';

// // // // // // class HomePage extends StatelessWidget {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final size = MediaQuery.of(context).size;

// // // // // //     return SafeArea(
// // // // // //       child: Scaffold(
// // // // // //         backgroundColor: Colors.grey[200],
// // // // // //         body: SingleChildScrollView(
// // // // // //           child: Column(
// // // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //             children: [
// // // // // //               // Header Section
// // // // // //               Container(
// // // // // //                 width: size.width,
// // // // // //                 height: size.height * 0.3,
// // // // // //                 decoration: BoxDecoration(
// // // // // //                   color: Colors.purple,
                  
// // // // // //                 ),
// // // // // //                 child: Padding(
// // // // // //                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // // //                   child: Column(
// // // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                     children: [
// // // // // //                       SizedBox(height: size.height * 0.06),
// // // // // //                       // Notifications and User Icon
// // // // // //                       Row(
// // // // // //                         mainAxisAlignment: MainAxisAlignment.end,
// // // // // //                         children: [
// // // // // //                           Icon(Icons.notifications, color: Colors.white),
// // // // // //                           SizedBox(width: size.width * 0.03),
// // // // // //                           CircleAvatar(
// // // // // //                             radius: size.width * 0.04,
// // // // // //                             backgroundColor: Colors.white,
// // // // // //                             child: Icon(Icons.person, color: Colors.purple),
// // // // // //                           ),
// // // // // //                         ],
// // // // // //                       ),
// // // // // //                       SizedBox(height: size.height * 0.02),
// // // // // //                       // Greeting Section
// // // // // //                       Row(
// // // // // //                         crossAxisAlignment: CrossAxisAlignment.center,
// // // // // //                         children: [
// // // // // //                           CircleAvatar(
// // // // // //                             radius: size.width * 0.08,
// // // // // //                             backgroundImage: AssetImage('assets/images/profile_pic.png'),
// // // // // //                           ),
// // // // // //                           SizedBox(width: size.width * 0.04),
// // // // // //                           Column(
// // // // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                             children: [
// // // // // //                               Text(
// // // // // //                                 "Good Morning",
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: size.width * 0.06,
// // // // // //                                   fontWeight: FontWeight.bold,
// // // // // //                                   color: Colors.white,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                               SizedBox(height: size.height * 0.005),
// // // // // //                               Text(
// // // // // //                                 "Lot of tasks are waiting for you",
// // // // // //                                 style: TextStyle(
// // // // // //                                   fontSize: size.width * 0.04,
// // // // // //                                   color: Colors.white.withOpacity(0.8),
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                             ],
// // // // // //                           ),
// // // // // //                         ],
// // // // // //                       ),
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               SizedBox(height: size.height * 0.02),
// // // // // //               // Search Bar
// // // // // //               Padding(
// // // // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // // //                 child: TextField(
// // // // // //                   decoration: InputDecoration(
// // // // // //                     hintText: "Search",
// // // // // //                     prefixIcon: Icon(Icons.search),
// // // // // //                     border: OutlineInputBorder(
// // // // // //                       borderRadius: BorderRadius.circular(80),
// // // // // //                     ),
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               SizedBox(height: size.height * 0.03),
// // // // // //               // My Projects Section
// // // // // //               Padding(
// // // // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // // //                 child: Row(
// // // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                   children: [
// // // // // //                     Text(
// // // // // //                       "My projects",
// // // // // //                       style: TextStyle(
// // // // // //                         fontSize: size.width * 0.05,
// // // // // //                         fontWeight: FontWeight.bold,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     Icon(Icons.keyboard_arrow_down, color: Colors.black),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //               SizedBox(height: size.height * 0.02),
// // // // // //               // Project Cards
// // // // // //               Padding(
// // // // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // // //                 child: Column(
// // // // // //                   children: [
// // // // // //                     _buildProjectCard(
// // // // // //                       size,
// // // // // //                       title: "E-commerce app",
// // // // // //                       subtitle: "Redesign UI",
// // // // // //                       totalTasks: 10,
// // // // // //                       pendingTasks: 5,
// // // // // //                       completedTasks: 5,
// // // // // //                       estimatedHours: 30,
// // // // // //                       workedHours: 15,
// // // // // //                     ),
// // // // // //                     SizedBox(height: size.height * 0.02),
// // // // // //                     _buildProjectCard(
// // // // // //                       size,
// // // // // //                       title: "Certifier - web application",
// // // // // //                       subtitle: "Design UI",
// // // // // //                       totalTasks: 15,
// // // // // //                       pendingTasks: 5,
// // // // // //                       completedTasks: 10,
// // // // // //                       estimatedHours: 40,
// // // // // //                       workedHours: 30,
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   // Helper Widget for Project Cards
// // // // // //   Widget _buildProjectCard(
// // // // // //     Size size, {
// // // // // //     required String title,
// // // // // //     required String subtitle,
// // // // // //     required int totalTasks,
// // // // // //     required int pendingTasks,
// // // // // //     required int completedTasks,
// // // // // //     required int estimatedHours,
// // // // // //     required int workedHours,
// // // // // //   }) {
// // // // // //     return Container(
// // // // // //       padding: EdgeInsets.all(size.width * 0.04),
// // // // // //       decoration: BoxDecoration(
// // // // // //         color: Colors.white,
// // // // // //         borderRadius: BorderRadius.circular(10),
// // // // // //         boxShadow: [
// // // // // //           BoxShadow(
// // // // // //             color: Colors.grey.withOpacity(0.2),
// // // // // //             blurRadius: 10,
// // // // // //             offset: Offset(0, 4),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       child: Column(
// // // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //         children: [
// // // // // //           // Title and Subtitle
// // // // // //           Text(
// // // // // //             title,
// // // // // //             style: TextStyle(
// // // // // //               fontSize: size.width * 0.05,
// // // // // //               fontWeight: FontWeight.bold,
// // // // // //             ),
// // // // // //           ),
// // // // // //           SizedBox(height: size.height * 0.005),
// // // // // //           Text(
// // // // // //             subtitle,
// // // // // //             style: TextStyle(
// // // // // //               fontSize: size.width * 0.04,
// // // // // //               color: Colors.grey,
// // // // // //             ),
// // // // // //           ),
// // // // // //           SizedBox(height: size.height * 0.02),
// // // // // //           // Task Details
// // // // // //           Row(
// // // // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //             children: [
// // // // // //               Text(
// // // // // //                 "Total tasks: $totalTasks",
// // // // // //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // // // //               ),
// // // // // //               Row(
// // // // // //                 children: [
// // // // // //                   Text(
// // // // // //                     "Task pending: $pendingTasks",
// // // // // //                     style: TextStyle(fontSize: size.width * 0.04, color: Colors.red),
// // // // // //                   ),
// // // // // //                   SizedBox(width: size.width * 0.02),
// // // // // //                   Text(
// // // // // //                     "Task Completed: $completedTasks",
// // // // // //                     style: TextStyle(fontSize: size.width * 0.04, color: Colors.green),
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           SizedBox(height: size.height * 0.015),
// // // // // //           // Hours Details
// // // // // //           Row(
// // // // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //             children: [
// // // // // //               Text(
// // // // // //                 "Estimated Hours: $estimatedHours Hrs",
// // // // // //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // // // //               ),
// // // // // //               Text(
// // // // // //                 "Hours worked: $workedHours Hrs",
// // // // // //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }


// // // // // import 'package:flutter/material.dart';

// // // // // class HomePage extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final size = MediaQuery.of(context).size;

// // // // //     return SafeArea(
// // // // //       child: Scaffold(
// // // // //         backgroundColor: Colors.grey[200],
// // // // //         body: SingleChildScrollView(
// // // // //           child: Column(
// // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //             children: [
// // // // //               // Header Section
// // // // //               Container(
// // // // //                 width: size.width,
// // // // //                 height: size.height * 0.3,
// // // // //                 decoration: BoxDecoration(
// // // // //                   color: Colors.purple,
// // // // //                 ),
// // // // //                 child: Padding(
// // // // //                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // //                   child: Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     children: [
// // // // //                       SizedBox(height: size.height * 0.03),
// // // // //                       // Back Arrow, Notifications, and User Icon
// // // // //                       Row(
// // // // //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                         children: [
// // // // //                           GestureDetector(
// // // // //                             onTap: () {
// // // // //                               Navigator.pop(context);
// // // // //                             },
// // // // //                             child: Icon(Icons.arrow_back, color: Colors.white),
// // // // //                           ),
// // // // //                           Row(
// // // // //                             children: [
// // // // //                               Stack(
// // // // //                                 children: [
// // // // //                                   Icon(Icons.notifications, color: Colors.white),
// // // // //                                   Positioned(
// // // // //                                     right: 0,
// // // // //                                     top: 0,
// // // // //                                     child: CircleAvatar(
// // // // //                                       radius: size.width * 0.015,
// // // // //                                       backgroundColor: Colors.white,
// // // // //                                     ),
// // // // //                                   ),
// // // // //                                 ],
// // // // //                               ),
// // // // //                               SizedBox(width: size.width * 0.03),
// // // // //                               Stack(
// // // // //                                 children: [
// // // // //                                   CircleAvatar(
// // // // //                                     radius: size.width * 0.04,
// // // // //                                     backgroundColor: Colors.white,
// // // // //                                     backgroundImage:
// // // // //                                     AssetImage('assets/images/profile.png'),
// // // // //                                   ),
                                 
// // // // //                                 ],
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                       SizedBox(height: size.height * 0.02),
// // // // //                       // Greeting Section
// // // // //                        Row(
// // // // //                         crossAxisAlignment: CrossAxisAlignment.center,
// // // // //                         children: [
// // // // //                           Stack(
// // // // //                             children: [
// // // // //                               CircleAvatar(
// // // // //                                 radius: size.width * 0.1,
// // // // //                                 backgroundImage:
// // // // //                                     AssetImage('assets/images/profile.png'),
// // // // //                               ),
// // // // //                               Positioned(
// // // // //                                 bottom: 4,
// // // // //                                 right: 4,
// // // // //                                 child: Container(
// // // // //                                   height: size.width * 0.03,
// // // // //                                   width: size.width * 0.03,
// // // // //                                   decoration: BoxDecoration(
// // // // //                                     shape: BoxShape.circle,
// // // // //                                     color: Colors.green,
// // // // //                                     border: Border.all(
// // // // //                                       color: Colors.white,
// // // // //                                       width: 2,
// // // // //                                     ),
// // // // //                                   ),
// // // // //                                 ),
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                           SizedBox(width: size.width * 0.04),
// // // // //                           Column(
// // // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                             children: [
// // // // //                               Text(
// // // // //                                 "Good Morning",
// // // // //                                 style: TextStyle(
// // // // //                                   fontSize: size.width * 0.06,
// // // // //                                   fontWeight: FontWeight.bold,
// // // // //                                   color: Colors.white,
// // // // //                                 ),
// // // // //                               ),
// // // // //                               SizedBox(height: size.height * 0.005),
// // // // //                               Text(
// // // // //                                 "Lot of tasks are waiting for you",
// // // // //                                 style: TextStyle(
// // // // //                                   fontSize: size.width * 0.04,
// // // // //                                   color: Colors.white.withOpacity(0.8),
// // // // //                                 ),
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                     ],
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //               SizedBox(height: size.height * 0.02),
// // // // //               // Search Bar
// // // // //               Padding(
// // // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // //                 child: TextField(
// // // // //                   decoration: InputDecoration(
// // // // //                     hintText: "Search",
// // // // //                     prefixIcon: Icon(Icons.search),
// // // // //                     border: OutlineInputBorder(
// // // // //                       borderRadius: BorderRadius.circular(80),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //               SizedBox(height: size.height * 0.03),
// // // // //               // My Projects Section
// // // // //               Padding(
// // // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // //                 child: Row(
// // // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       "My projects",
// // // // //                       style: TextStyle(
// // // // //                         fontSize: size.width * 0.05,
// // // // //                         fontWeight: FontWeight.bold,
// // // // //                       ),
// // // // //                     ),
// // // // //                     Icon(Icons.keyboard_arrow_down, color: Colors.black),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //               SizedBox(height: size.height * 0.02),
// // // // //               // Project Cards
// // // // //               Padding(
// // // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // // //                 child: Column(
// // // // //                   children: [
// // // // //                     _buildProjectCard(
// // // // //                       size,
// // // // //                       title: "E-commerce app",
// // // // //                       subtitle: "Redesign UI",
// // // // //                       totalTasks: 10,
// // // // //                       pendingTasks: 5,
// // // // //                       completedTasks: 5,
// // // // //                       estimatedHours: 30,
// // // // //                       workedHours: 15,
// // // // //                     ),
// // // // //                     SizedBox(height: size.height * 0.02),
// // // // //                     _buildProjectCard(
// // // // //                       size,
// // // // //                       title: "Certifier - web application",
// // // // //                       subtitle: "Design UI",
// // // // //                       totalTasks: 15,
// // // // //                       pendingTasks: 5,
// // // // //                       completedTasks: 10,
// // // // //                       estimatedHours: 40,
// // // // //                       workedHours: 30,
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // Helper Widget for Project Cards
// // // // //   Widget _buildProjectCard(
// // // // //     Size size, {
// // // // //     required String title,
// // // // //     required String subtitle,
// // // // //     required int totalTasks,
// // // // //     required int pendingTasks,
// // // // //     required int completedTasks,
// // // // //     required int estimatedHours,
// // // // //     required int workedHours,
// // // // //   }) {
// // // // //     return Container(
// // // // //       padding: EdgeInsets.all(size.width * 0.04),
// // // // //       decoration: BoxDecoration(
// // // // //         color: Colors.white,
// // // // //         borderRadius: BorderRadius.circular(10),
// // // // //         boxShadow: [
// // // // //           BoxShadow(
// // // // //             color: Colors.grey.withOpacity(0.2),
// // // // //             blurRadius: 10,
// // // // //             offset: Offset(0, 4),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       child: Column(
// // // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //         children: [
// // // // //           // Title and Subtitle
// // // // //           Text(
// // // // //             title,
// // // // //             style: TextStyle(
// // // // //               fontSize: size.width * 0.05,
// // // // //               fontWeight: FontWeight.bold,
// // // // //             ),
// // // // //           ),
// // // // //           SizedBox(height: size.height * 0.005),
// // // // //           Text(
// // // // //             subtitle,
// // // // //             style: TextStyle(
// // // // //               fontSize: size.width * 0.04,
// // // // //               color: Colors.grey,
// // // // //             ),
// // // // //           ),
// // // // //           SizedBox(height: size.height * 0.02),
// // // // //           // Task Details
// // // // //           Row(
// // // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //             children: [
// // // // //               Text(
// // // // //                 "Total tasks: $totalTasks",
// // // // //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // // //               ),
// // // // //               Row(
// // // // //                 children: [
// // // // //                   Text(
// // // // //                     "Task pending: $pendingTasks",
// // // // //                     style: TextStyle(fontSize: size.width * 0.04, color: Colors.red),
// // // // //                   ),
// // // // //                   SizedBox(width: size.width * 0.02),
// // // // //                   Text(
// // // // //                     "Task Completed: $completedTasks",
// // // // //                     style: TextStyle(fontSize: size.width * 0.04, color: Colors.green),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           SizedBox(height: size.height * 0.015),
// // // // //           // Hours Details
// // // // //           Row(
// // // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //             children: [
// // // // //               Text(
// // // // //                 "Estimated Hours: $estimatedHours Hrs",
// // // // //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // // //               ),
// // // // //               Text(
// // // // //                 "Hours worked: $workedHours Hrs",
// // // // //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }




// // // // import 'package:flutter/material.dart';

// // // // class HomePage extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final size = MediaQuery.of(context).size;

// // // //     return SafeArea(
// // // //       child: Scaffold(
// // // //         backgroundColor: Colors.grey[200],
// // // //         body: SingleChildScrollView(
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               // Header Section
// // // //               Container(
// // // //                 width: size.width,
// // // //                 height: size.height * 0.3,
// // // //                 decoration: BoxDecoration(
// // // //                   color: Colors.purple,
// // // //                 ),
// // // //                 child: Padding(
// // // //                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       SizedBox(height: size.height * 0.06),
// // // //                       // Notifications and User Icon
// // // //                       Row(
// // // //                         mainAxisAlignment: MainAxisAlignment.end,
// // // //                         children: [
// // // //                           Stack(
// // // //                             children: [
// // // //                               Icon(Icons.notifications, color: Colors.white),
// // // //                               Positioned(
// // // //                                 right: 0,
// // // //                                 top: 0,
// // // //                                 child: CircleAvatar(
// // // //                                   radius: size.width * 0.015,
// // // //                                   backgroundColor: Colors.white,
// // // //                                 ),
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                           SizedBox(width: size.width * 0.03),
// // // //                           CircleAvatar(
// // // //                             radius: size.width * 0.04,
// // // //                             backgroundColor: Colors.white,
// // // //                              backgroundImage:
// // // //                                     AssetImage('assets/images/profile.png'),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                       SizedBox(height: size.height * 0.02),
// // // //                       // Greeting Section
// // // //                       Row(
// // // //                         crossAxisAlignment: CrossAxisAlignment.center,
// // // //                         children: [
// // // //                           Stack(
// // // //                             children: [
// // // //                               CircleAvatar(
// // // //                                 radius: size.width * 0.08,
// // // //                                 backgroundImage:
// // // //                                     AssetImage('assets/images/profile.png'),
// // // //                               ),
// // // //                               Positioned(
// // // //                                 right: 0,
// // // //                                 bottom: 0,
// // // //                                 child: CircleAvatar(
// // // //                                   radius: size.width * 0.02,
// // // //                                   backgroundColor: Colors.green,
// // // //                                 ),
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                           SizedBox(width: size.width * 0.04),
// // // //                           Flexible(
// // // //                             child: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 Text(
// // // //                                   "Good Morning",
// // // //                                   style: TextStyle(
// // // //                                     fontSize: size.width * 0.06,
// // // //                                     fontWeight: FontWeight.bold,
// // // //                                     color: Colors.white,
// // // //                                   ),
// // // //                                   maxLines: 1,
// // // //                                   overflow: TextOverflow.ellipsis,
// // // //                                 ),
// // // //                                 SizedBox(height: size.height * 0.005),
// // // //                                 Text(
// // // //                                   "Lot of tasks are waiting for you",
// // // //                                   style: TextStyle(
// // // //                                     fontSize: size.width * 0.04,
// // // //                                     color: Colors.white.withOpacity(0.8),
// // // //                                   ),
// // // //                                   maxLines: 2,
// // // //                                   overflow: TextOverflow.ellipsis,
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               SizedBox(height: size.height * 0.02),
// // // //               // Search Bar
// // // //               Padding(
// // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // //                 child: TextField(
// // // //                   decoration: InputDecoration(
// // // //                     hintText: "Search",
// // // //                     prefixIcon: Icon(Icons.search),
// // // //                     border: OutlineInputBorder(
// // // //                       borderRadius: BorderRadius.circular(80),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               SizedBox(height: size.height * 0.03),
// // // //               // My Projects Section
// // // //               Padding(
// // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // //                 child: Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       "My projects",
// // // //                       style: TextStyle(
// // // //                         fontSize: size.width * 0.05,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                     ),
// // // //                     Icon(Icons.keyboard_arrow_down, color: Colors.black),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //               SizedBox(height: size.height * 0.02),
// // // //               // Project Cards
// // // //               Padding(
// // // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // // //                 child: Column(
// // // //                   children: [
// // // //                     _buildProjectCard(
// // // //                       size,
// // // //                       title: "E-commerce app",
// // // //                       subtitle: "Redesign UI",
// // // //                       totalTasks: 10,
// // // //                       pendingTasks: 5,
// // // //                       completedTasks: 5,
// // // //                       estimatedHours: 30,
// // // //                       workedHours: 15,
// // // //                     ),
// // // //                     SizedBox(height: size.height * 0.02),
// // // //                     _buildProjectCard(
// // // //                       size,
// // // //                       title: "Certifier - web application",
// // // //                       subtitle: "Design UI",
// // // //                       totalTasks: 15,
// // // //                       pendingTasks: 5,
// // // //                       completedTasks: 10,
// // // //                       estimatedHours: 40,
// // // //                       workedHours: 30,
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // Helper Widget for Project Cards
// // // //   Widget _buildProjectCard(
// // // //     Size size, {
// // // //     required String title,
// // // //     required String subtitle,
// // // //     required int totalTasks,
// // // //     required int pendingTasks,
// // // //     required int completedTasks,
// // // //     required int estimatedHours,
// // // //     required int workedHours,
// // // //   }) {
// // // //     return Container(
// // // //       padding: EdgeInsets.all(size.width * 0.04),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.circular(10),
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: Colors.grey.withOpacity(0.2),
// // // //             blurRadius: 10,
// // // //             offset: Offset(0, 4),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           // Title and Subtitle
// // // //           Text(
// // // //             title,
// // // //             style: TextStyle(
// // // //               fontSize: size.width * 0.05,
// // // //               fontWeight: FontWeight.bold,
// // // //             ),
// // // //             maxLines: 1,
// // // //             overflow: TextOverflow.ellipsis,
// // // //           ),
// // // //           SizedBox(height: size.height * 0.005),
// // // //           Text(
// // // //             subtitle,
// // // //             style: TextStyle(
// // // //               fontSize: size.width * 0.04,
// // // //               color: Colors.grey,
// // // //             ),
// // // //             maxLines: 1,
// // // //             overflow: TextOverflow.ellipsis,
// // // //           ),
// // // //           SizedBox(height: size.height * 0.02),
// // // //           // Task Details
// // // //           Wrap(
// // // //             alignment: WrapAlignment.spaceBetween,
// // // //             spacing: size.width * 0.02,
// // // //             children: [
// // // //               Text(
// // // //                 "Total tasks: $totalTasks",
// // // //                 style:
// // // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // //               ),
// // // //               Text(
// // // //                 "Task pending: $pendingTasks",
// // // //                 style:
// // // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.red),
// // // //               ),
// // // //               Text(
// // // //                 "Task Completed: $completedTasks",
// // // //                 style:
// // // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.green),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           SizedBox(height: size.height * 0.015),
// // // //           // Hours Details
// // // //           Wrap(
// // // //             alignment: WrapAlignment.spaceBetween,
// // // //             spacing: size.width * 0.02,
// // // //             children: [
// // // //               Text(
// // // //                 "Estimated Hours: $estimatedHours Hrs",
// // // //                 style:
// // // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // //               ),
// // // //               Text(
// // // //                 "Hours worked: $workedHours Hrs",
// // // //                 style:
// // // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'login_page.dart'; // Import your login page

// // // class HomePage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final size = MediaQuery.of(context).size;

// // //     return SafeArea(
// // //       child: Scaffold(
// // //         backgroundColor: Colors.grey[200],
        
// // //         body: SingleChildScrollView(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               // Header Section
// // //               Container(
// // //                 width: size.width,
// // //                 height: size.height * 0.3,
// // //                 decoration: BoxDecoration(
// // //                   color: Colors.purple,
// // //                 ),
// // //                 child: Padding(
// // //                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       SizedBox(height: size.height * 0.06),
// // //                       // Notifications and User Icon
// // //                       Row(
// // //                         mainAxisAlignment: MainAxisAlignment.end,
// // //                         children: [
// // //                           Stack(
// // //                             children: [
// // //                               Icon(Icons.notifications, color: Colors.white),
// // //                               Positioned(
// // //                                 right: 0,
// // //                                 top: 0,
// // //                                 child: CircleAvatar(
// // //                                   radius: size.width * 0.015,
// // //                                   backgroundColor: Colors.white,
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                           SizedBox(width: size.width * 0.03),
// // //                           CircleAvatar(
// // //                             radius: size.width * 0.04,
// // //                             backgroundColor: Colors.white,
// // //                             backgroundImage:
// // //                                 AssetImage('assets/images/profile.png'),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       SizedBox(height: size.height * 0.02),
// // //                       // Greeting Section
// // //                       Row(
// // //                         crossAxisAlignment: CrossAxisAlignment.center,
// // //                         children: [
// // //                           Stack(
// // //                             children: [
// // //                               CircleAvatar(
// // //                                 radius: size.width * 0.08,
// // //                                 backgroundImage:
// // //                                     AssetImage('assets/images/profile.png'),
// // //                               ),
// // //                               Positioned(
// // //                                 right: 0,
// // //                                 bottom: 0,
// // //                                 child: CircleAvatar(
// // //                                   radius: size.width * 0.02,
// // //                                   backgroundColor: Colors.green,
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                           SizedBox(width: size.width * 0.04),
// // //                           Flexible(
// // //                             child: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 Text(
// // //                                   "Good Morning",
// // //                                   style: TextStyle(
// // //                                     fontSize: size.width * 0.06,
// // //                                     fontWeight: FontWeight.bold,
// // //                                     color: Colors.white,
// // //                                   ),
// // //                                   maxLines: 1,
// // //                                   overflow: TextOverflow.ellipsis,
// // //                                 ),
// // //                                 SizedBox(height: size.height * 0.005),
// // //                                 Text(
// // //                                   "Lot of tasks are waiting for you",
// // //                                   style: TextStyle(
// // //                                     fontSize: size.width * 0.04,
// // //                                     color: Colors.white.withOpacity(0.8),
// // //                                   ),
// // //                                   maxLines: 2,
// // //                                   overflow: TextOverflow.ellipsis,
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.02),
// // //               // Search Bar
// // //               Padding(
// // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // //                 child: TextField(
// // //                   decoration: InputDecoration(
// // //                     hintText: "Search",
// // //                     prefixIcon: Icon(Icons.search),
// // //                     border: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(80),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.03),
// // //               // My Projects Section
// // //               Padding(
// // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // //                 child: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Text(
// // //                       "My projects",
// // //                       style: TextStyle(
// // //                         fontSize: size.width * 0.05,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                     Icon(Icons.keyboard_arrow_down, color: Colors.black),
// // //                   ],
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.02),
// // //               // Project Cards
// // //               Padding(
// // //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// // //                 child: Column(
// // //                   children: [
// // //                     _buildProjectCard(
// // //                       size,
// // //                       title: "E-commerce app",
// // //                       subtitle: "Redesign UI",
// // //                       totalTasks: 10,
// // //                       pendingTasks: 5,
// // //                       completedTasks: 5,
// // //                       estimatedHours: 30,
// // //                       workedHours: 15,
// // //                     ),
// // //                     SizedBox(height: size.height * 0.02),
// // //                     _buildProjectCard(
// // //                       size,
// // //                       title: "Certifier - web application",
// // //                       subtitle: "Design UI",
// // //                       totalTasks: 15,
// // //                       pendingTasks: 5,
// // //                       completedTasks: 10,
// // //                       estimatedHours: 40,
// // //                       workedHours: 30,
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // Helper Widget for Project Cards
// // //   Widget _buildProjectCard(
// // //     Size size, {
// // //     required String title,
// // //     required String subtitle,
// // //     required int totalTasks,
// // //     required int pendingTasks,
// // //     required int completedTasks,
// // //     required int estimatedHours,
// // //     required int workedHours,
// // //   }) {
// // //     return Container(
// // //       padding: EdgeInsets.all(size.width * 0.04),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(10),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.grey.withOpacity(0.2),
// // //             blurRadius: 10,
// // //             offset: Offset(0, 4),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           // Title and Subtitle
// // //           Text(
// // //             title,
// // //             style: TextStyle(
// // //               fontSize: size.width * 0.05,
// // //               fontWeight: FontWeight.bold,
// // //             ),
// // //             maxLines: 1,
// // //             overflow: TextOverflow.ellipsis,
// // //           ),
// // //           SizedBox(height: size.height * 0.005),
// // //           Text(
// // //             subtitle,
// // //             style: TextStyle(
// // //               fontSize: size.width * 0.04,
// // //               color: Colors.grey,
// // //             ),
// // //             maxLines: 1,
// // //             overflow: TextOverflow.ellipsis,
// // //           ),
// // //           SizedBox(height: size.height * 0.02),
// // //           // Task Details
// // //           Wrap(
// // //             alignment: WrapAlignment.spaceBetween,
// // //             spacing: size.width * 0.02,
// // //             children: [
// // //               Text(
// // //                 "Total tasks: $totalTasks",
// // //                 style:
// // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // //               ),
// // //               Text(
// // //                 "Task pending: $pendingTasks",
// // //                 style:
// // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.red),
// // //               ),
// // //               Text(
// // //                 "Task Completed: $completedTasks",
// // //                 style:
// // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.green),
// // //               ),
// // //             ],
// // //           ),
// // //           SizedBox(height: size.height * 0.015),
// // //           // Hours Details
// // //           Wrap(
// // //             alignment: WrapAlignment.spaceBetween,
// // //             spacing: size.width * 0.02,
// // //             children: [
// // //               Text(
// // //                 "Estimated Hours: $estimatedHours Hrs",
// // //                 style:
// // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // //               ),
// // //               Text(
// // //                 "Hours worked: $workedHours Hrs",
// // //                 style:
// // //                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   // Logout function
// // //   void _logout(BuildContext context) async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     await prefs.clear(); // Clear saved user data
// // //     Navigator.pushReplacement(
// // //       context,
// // //       MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'login_page.dart'; // Import your login page

// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;

// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: Colors.grey[200],
// //         body: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Header Section
// //               Container(
// //                 width: size.width,
// //                 height: size.height * 0.3,
// //                 decoration: BoxDecoration(
// //                   color: Colors.purple,
// //                 ),
// //                 child: Padding(
// //                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       SizedBox(height: size.height * 0.06),
// //                       // Notifications and User Icon
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.end,
// //                         children: [
// //                           Stack(
// //                             children: [
// //                               Icon(Icons.notifications, color: Colors.white),
// //                               Positioned(
// //                                 right: 0,
// //                                 top: 0,
// //                                 child: CircleAvatar(
// //                                   radius: size.width * 0.015,
// //                                   backgroundColor: Colors.white,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(width: size.width * 0.03),
// //                           // PopupMenuButton for Profile and Logout
// //                           PopupMenuButton<int>(
// //                             icon: CircleAvatar(
// //                               radius: size.width * 0.04,
// //                               backgroundColor: Colors.white,
// //                               backgroundImage: AssetImage('assets/images/profile.png'),
// //                             ),
// //                             onSelected: (value) {
// //                               if (value == 1) {
// //                                 _logout(context); // Handle logout
// //                               } else if (value == 0) {
// //                                 // Handle profile settings navigation
// //                                 _navigateToProfileSettings(context);
// //                               }
// //                             },
// //                             itemBuilder: (context) => [
// //                               PopupMenuItem<int>(
// //                                 value: 0,
// //                                 child: Row(
// //                                   children: [
// //                                     Icon(Icons.account_circle),
// //                                     SizedBox(width: 8),
// //                                     Text("Profile Settings"),
// //                                   ],
// //                                 ),
// //                               ),
// //                               PopupMenuItem<int>(
// //                                 value: 1,
// //                                 child: Row(
// //                                   children: [
// //                                     Icon(Icons.logout),
// //                                     SizedBox(width: 8),
// //                                     Text("Logout"),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: size.height * 0.02),
// //                       // Greeting Section
// //                       Row(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           Stack(
// //                             children: [
// //                               CircleAvatar(
// //                                 radius: size.width * 0.08,
// //                                 backgroundImage: AssetImage('assets/images/profile.png'),
// //                               ),
// //                               Positioned(
// //                                 right: 0,
// //                                 bottom: 0,
// //                                 child: CircleAvatar(
// //                                   radius: size.width * 0.02,
// //                                   backgroundColor: Colors.green,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(width: size.width * 0.04),
// //                           Flexible(
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   "Good Morning",
// //                                   style: TextStyle(
// //                                     fontSize: size.width * 0.06,
// //                                     fontWeight: FontWeight.bold,
// //                                     color: Colors.white,
// //                                   ),
// //                                   maxLines: 1,
// //                                   overflow: TextOverflow.ellipsis,
// //                                 ),
// //                                 SizedBox(height: size.height * 0.005),
// //                                 Text(
// //                                   "Lot of tasks are waiting for you",
// //                                   style: TextStyle(
// //                                     fontSize: size.width * 0.04,
// //                                     color: Colors.white.withOpacity(0.8),
// //                                   ),
// //                                   maxLines: 2,
// //                                   overflow: TextOverflow.ellipsis,
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.02),
// //               // Search Bar
// //               Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// //                 child: TextField(
// //                   decoration: InputDecoration(
// //                     hintText: "Search",
// //                     prefixIcon: Icon(Icons.search),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(80),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.03),
// //               // My Projects Section
// //               Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       "My projects",
// //                       style: TextStyle(
// //                         fontSize: size.width * 0.05,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     Icon(Icons.keyboard_arrow_down, color: Colors.black),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.02),
// //               // Project Cards
// //               Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
// //                 child: Column(
// //                   children: [
// //                     _buildProjectCard(
// //                       size,
// //                       title: "E-commerce app",
// //                       subtitle: "Redesign UI",
// //                       totalTasks: 10,
// //                       pendingTasks: 5,
// //                       completedTasks: 5,
// //                       estimatedHours: 30,
// //                       workedHours: 15,
// //                     ),
// //                     SizedBox(height: size.height * 0.02),
// //                     _buildProjectCard(
// //                       size,
// //                       title: "Certifier - web application",
// //                       subtitle: "Design UI",
// //                       totalTasks: 15,
// //                       pendingTasks: 5,
// //                       completedTasks: 10,
// //                       estimatedHours: 40,
// //                       workedHours: 30,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // Helper Widget for Project Cards
// //   Widget _buildProjectCard(
// //     Size size, {
// //     required String title,
// //     required String subtitle,
// //     required int totalTasks,
// //     required int pendingTasks,
// //     required int completedTasks,
// //     required int estimatedHours,
// //     required int workedHours,
// //   }) {
// //     return Container(
// //       padding: EdgeInsets.all(size.width * 0.04),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(10),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.2),
// //             blurRadius: 10,
// //             offset: Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Title and Subtitle
// //           Text(
// //             title,
// //             style: TextStyle(
// //               fontSize: size.width * 0.05,
// //               fontWeight: FontWeight.bold,
// //             ),
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //           ),
// //           SizedBox(height: size.height * 0.005),
// //           Text(
// //             subtitle,
// //             style: TextStyle(
// //               fontSize: size.width * 0.04,
// //               color: Colors.grey,
// //             ),
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //           ),
// //           SizedBox(height: size.height * 0.02),
// //           // Task Details
// //           Wrap(
// //             alignment: WrapAlignment.spaceBetween,
// //             spacing: size.width * 0.02,
// //             children: [
// //               Text(
// //                 "Total tasks: $totalTasks",
// //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// //               ),
// //               Text(
// //                 "Task pending: $pendingTasks",
// //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.red),
// //               ),
// //               Text(
// //                 "Task Completed: $completedTasks",
// //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.green),
// //               ),
// //             ],
// //           ),
// //           SizedBox(height: size.height * 0.015),
// //           // Hours Details
// //           Wrap(
// //             alignment: WrapAlignment.spaceBetween,
// //             spacing: size.width * 0.02,
// //             children: [
// //               Text(
// //                 "Estimated Hours: $estimatedHours Hrs",
// //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// //               ),
// //               Text(
// //                 "Hours worked: $workedHours Hrs",
// //                 style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // Navigate to Profile Settings
// //   void _navigateToProfileSettings(BuildContext context) {
// //     // Navigate to profile settings screen
// //     // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
// //   }

// //   // Logout function
// //   void _logout(BuildContext context) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.clear(); // Clear saved user data
// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
// //     );
// //   }
// // }


// import 'dart:convert';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:time_sheet_app/view/login_page.dart';
// import 'package:time_sheet_app/view/project_detailed_page.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Future<List<dynamic>> fetchProjects() async {
//     final url = Uri.parse('https://api.brandexperts.ae/api/projects/');
//     final response = await http.get(
//       url,
//       headers: {
//         'Authorization':
//             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3MjI5Mjc5LCJpYXQiOjE3MzQ2MzcyNzksImp0aSI6ImNjMGUwNWM0ZWM1MjRiZDJhNGUwYTUzMjY5ZjJhMTBjIiwidXNlcl9pZCI6MTZ9.VwN7TjfebbaMl4j_AsMcRH4K4FnUrL_T7CYtIpFVytA',
//       },
//     );

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else if (response.statusCode == 401) {
//       throw Exception('Unauthorized: Check your token');
//     } else {
//       throw Exception(
//           'Failed to load projects. Status code: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey[200],
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Section
//               Container(
//                 width: size.width,
//                 height: size.height * 0.3,
//                 decoration: BoxDecoration(
//                   color: Colors.purple,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: size.height * 0.06),
//                       // Notifications and User Icon
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Stack(
//                             children: [
//                               Icon(Icons.notifications, color: Colors.white),
//                               Positioned(
//                                 right: 0,
//                                 top: 0,
//                                 child: CircleAvatar(
//                                   radius: size.width * 0.015,
//                                   backgroundColor: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: size.width * 0.03),
//                           CircleAvatar(
//                             radius: size.width * 0.04,
//                             backgroundColor: Colors.white,
//                             backgroundImage:
//                                 AssetImage('assets/images/profile.png'),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: size.height * 0.02),
//                       // Greeting Section
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Stack(
//                             children: [
//                               CircleAvatar(
//                                 radius: size.width * 0.08,
//                                 backgroundImage:
//                                     AssetImage('assets/images/profile.png'),
//                               ),
//                               Positioned(
//                                 right: 0,
//                                 bottom: 0,
//                                 child: CircleAvatar(
//                                   radius: size.width * 0.02,
//                                   backgroundColor: Colors.green,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(width: size.width * 0.04),
//                           Flexible(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Good Morning",
//                                   style: TextStyle(
//                                     fontSize: size.width * 0.06,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 SizedBox(height: size.height * 0.005),
//                                 Text(
//                                   "Lot of tasks are waiting for you",
//                                   style: TextStyle(
//                                     fontSize: size.width * 0.04,
//                                     color: Colors.white.withOpacity(0.8),
//                                   ),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//               // Search Bar
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(80),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.03),
//               // My Projects Section
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "My projects",
//                       style: TextStyle(
//                         fontSize: size.width * 0.05,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Icon(Icons.keyboard_arrow_down, color: Colors.black),
//                   ],
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//               // Project Cards with ListView.separated
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                 child: FutureBuilder<List<dynamic>>(
//                   future: fetchProjects(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Center(child: Text('No projects found'));
//                     } else {
//                       final projects = snapshot.data!;
//                       return ListView.separated(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: projects.length,
//                         itemBuilder: (context, index) {
//                           final project = projects[index];
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ProjectDetailedPage(
//                                     title: project['name'] ?? 'No title',
//                                     subtitle: project['description'] ??
//                                         'No description',
                                 
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: _buildProjectCard(
//                               size,
//                               title: project['name'] ?? 'No title',
//                               subtitle:
//                                   project['description'] ?? 'No description',
//                               totalTasks: 10,
//                               pendingTasks: 5,
//                               completedTasks: 5,
//                               estimatedHours: 30,
//                               workedHours: 15,
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return SizedBox(
//                               height:
//                                   size.height * 0.02); // Space between cards
//                         },
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper Widget for Project Cards
//   Widget _buildProjectCard(
//     Size size, {
//     required String title,
//     required String subtitle,
//     required int totalTasks,
//     required int pendingTasks,
//     required int completedTasks,
//     required int estimatedHours,
//     required int workedHours,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(size.width * 0.04),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title and Subtitle
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: size.width * 0.05,
//               fontWeight: FontWeight.bold,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SizedBox(height: size.height * 0.005),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: size.width * 0.04,
//               color: Colors.grey,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SizedBox(height: size.height * 0.02),
//           // Task Details
//           Wrap(
//             alignment: WrapAlignment.spaceBetween,
//             spacing: size.width * 0.02,
//             children: [
//               Text(
//                 "Total tasks: $totalTasks",
//                 style:
//                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
//               ),
//               Text(
//                 "Task pending: $pendingTasks",
//                 style:
//                     TextStyle(fontSize: size.width * 0.04, color: Colors.red),
//               ),
//               Text(
//                 "Task Completed: $completedTasks",
//                 style:
//                     TextStyle(fontSize: size.width * 0.04, color: Colors.green),
//               ),
//             ],
//           ),
//           SizedBox(height: size.height * 0.015),
//           // Hours Details
//           Wrap(
//             alignment: WrapAlignment.spaceBetween,
//             spacing: size.width * 0.02,
//             children: [
//               Text(
//                 "Estimated Hours: $estimatedHours Hrs",
//                 style:
//                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
//               ),
//               Text(
//                 "Hours worked: $workedHours Hrs",
//                 style:
//                     TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // Logout function
//   void _logout(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear(); // Clear saved user data
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_sheet_app/view/login_page.dart';
import 'package:time_sheet_app/view/project_detailed_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<dynamic>> fetchProjects() async {
    final url = Uri.parse('https://api.brandexperts.ae/api/projects/');
    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3MjI5Mjc5LCJpYXQiOjE3MzQ2MzcyNzksImp0aSI6ImNjMGUwNWM0ZWM1MjRiZDJhNGUwYTUzMjY5ZjJhMTBjIiwidXNlcl9pZCI6MTZ9.VwN7TjfebbaMl4j_AsMcRH4K4FnUrL_T7CYtIpFVytA',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Check your token');
    } else {
      throw Exception(
          'Failed to load projects. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.06),
                      // Notifications and User Icon with PopupMenu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Icon(Icons.notifications, color: Colors.white),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: CircleAvatar(
                                  radius: size.width * 0.015,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.03),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'logout') {
                                _logout(context);
                              }
                            },
                            icon: CircleAvatar(
                              radius: size.width * 0.04,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/images/profile.png'),
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'logout',
                                child: Row(
                                  children: [
                                    Icon(Icons.logout, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text('Logout'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      // Greeting Section
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: size.width * 0.08,
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  radius: size.width * 0.02,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.04),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Good Morning",
                                  style: TextStyle(
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: size.height * 0.005),
                                Text(
                                  "Lot of tasks are waiting for you",
                                  style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              // Search Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              // My Projects Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My projects",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              // Project Cards with ListView.separated
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: FutureBuilder<List<dynamic>>(
                  future: fetchProjects(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No projects found'));
                    } else {
                      final projects = snapshot.data!;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          final project = projects[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjectDetailedPage(
                                    title: project['name'] ?? 'No title',
                                    subtitle: project['description'] ??
                                        'No description',
                                  ),
                                ),
                              );
                            },
                            child: _buildProjectCard(
                              size,
                              title: project['name'] ?? 'No title',
                              subtitle:
                                  project['description'] ?? 'No description',
                              totalTasks: 10,
                              pendingTasks: 5,
                              completedTasks: 5,
                              estimatedHours: 30,
                              workedHours: 15,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                              height:
                                  size.height * 0.02); // Space between cards
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Project Cards
  Widget _buildProjectCard(
    Size size, {
    required String title,
    required String subtitle,
    required int totalTasks,
    required int pendingTasks,
    required int completedTasks,
    required int estimatedHours,
    required int workedHours,
  }) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Subtitle
          Text(
            title,
            style: TextStyle(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: size.height * 0.02),
          // Task Details
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: size.width * 0.02,
            children: [
              Text(
                "Total tasks: $totalTasks",
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
              ),
              Text(
                "Task pending: $pendingTasks",
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.red),
              ),
              Text(
                "Task Completed: $completedTasks",
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.015),
          // Hours Details
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: size.width * 0.02,
            children: [
              Text(
                "Estimated Hours: $estimatedHours Hrs",
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
              ),
              Text(
                "Hours worked: $workedHours Hrs",
                style:
                    TextStyle(fontSize: size.width * 0.04, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Logout function
  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear saved user data
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
    );
  }
}
