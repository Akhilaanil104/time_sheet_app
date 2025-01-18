

// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // // // // class ProjectDetailedPage extends StatefulWidget {
// // // // //   final String title;
// // // // //   final String subtitle;

// // // // //   const ProjectDetailedPage(
// // // // //       {super.key, required this.title, required this.subtitle});
// // // // //   @override
// // // // //   _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
// // // // // }

// // // // // class _ProjectDetailedPageState extends State<ProjectDetailedPage> {
// // // // //   final List<bool> _isExpanded = [
// // // // //     false,
// // // // //     false
// // // // //   ]; // Track "Show More"/"Show Less" state for each task

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final screenWidth = MediaQuery.of(context).size.width;

// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: Colors.purple,
// // // // //         elevation: 0,
// // // // //         leading: IconButton(
// // // // //           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
// // // // //           onPressed: () {
// // // // //             Navigator.pop(context);
// // // // //           },
// // // // //         ),
// // // // //         title: Text(
// // // // //           widget.title,
// // // // //           style: const TextStyle(color: Colors.white),
// // // // //         ),
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         padding: const EdgeInsets.all(16.0),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             // Description Card
// // // // //             Card(
// // // // //               shape: RoundedRectangleBorder(
// // // // //                 borderRadius: BorderRadius.circular(12),
// // // // //               ),
// // // // //               elevation: 3,
// // // // //               child: Padding(
// // // // //                 padding: const EdgeInsets.all(16.0),
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       widget.title,
// // // // //                       style: TextStyle(
// // // // //                         fontSize: screenWidth > 600 ? 22 : 18,
// // // // //                         fontWeight: FontWeight.bold,
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(height: 10),
// // // // //                     // const Text(
// // // // //                     //   'We need a visually appealing, user-friendly, and responsive design for the Home Page of our certificate issuing and validating platform. The page should effectively communicate the platform\'s purpose, features, and benefits to different target audiences (Companies, Partners, Brands, and General Public).',
// // // // //                     //   style: TextStyle(fontSize: 14),
// // // // //                     // ),
// // // // //                     // const SizedBox(height: 8),
// // // // //                     // const Text(
// // // // //                     //   'The design should include interactive elements, intuitive navigation, and clear calls-to-action (CTAs). The goal is to create a high-conversion landing page that is both informative and engaging.',
// // // // //                     //   style: TextStyle(fontSize: 14),
// // // // //                     // ),
// // // // //                     Text(
// // // // //                       widget.subtitle,
// // // // //                       style: TextStyle(fontSize: 14),
// // // // //                     )
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 20),

// // // // //             // Tasks Header
// // // // //             Text(
// // // // //               'Tasks',
// // // // //               style: TextStyle(
// // // // //                 fontSize: screenWidth > 600 ? 20 : 16,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 10),

// // // // //             // Task Cards
// // // // //             TaskCard(
// // // // //               taskTitle: 'Design the Home Page',
// // // // //               taskDescription:
// // // // //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// // // // //               isTaskCompleted: false,
// // // // //               isExpanded: _isExpanded[0],
// // // // //               onToggle: () {
// // // // //                 setState(() {
// // // // //                   _isExpanded[0] = !_isExpanded[0];
// // // // //                 });
// // // // //               },
// // // // //             ),
// // // // //             const SizedBox(height: 10),
// // // // //             TaskCard(
// // // // //               taskTitle: 'Design the "Pricing" Page',
// // // // //               taskDescription:
// // // // //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// // // // //               isTaskCompleted: false,
// // // // //               isExpanded: _isExpanded[1],
// // // // //               onToggle: () {
// // // // //                 setState(() {
// // // // //                   _isExpanded[1] = !_isExpanded[1];
// // // // //                 });
// // // // //               },
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class TaskCard extends StatefulWidget {
// // // // //   final String taskTitle;
// // // // //   final String taskDescription;
// // // // //   final bool isTaskCompleted;
// // // // //   final bool isExpanded;
// // // // //   final VoidCallback onToggle;

// // // // //   const TaskCard({
// // // // //     required this.taskTitle,
// // // // //     required this.taskDescription,
// // // // //     this.isTaskCompleted = false,
// // // // //     required this.isExpanded,
// // // // //     required this.onToggle,
// // // // //   });

// // // // //   @override
// // // // //   State<TaskCard> createState() => _TaskCardState();
// // // // // }

// // // // // class _TaskCardState extends State<TaskCard> {
// // // // //   bool isTaskStarted = false;
// // // // //   bool isTaskCompleted = false;
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final screenWidth = MediaQuery.of(context).size.width;

// // // // //     return Card(
// // // // //       shape: RoundedRectangleBorder(
// // // // //         borderRadius: BorderRadius.circular(12),
// // // // //       ),
// // // // //       elevation: 3,
// // // // //       child: Padding(
// // // // //         padding: const EdgeInsets.all(16.0),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             // Task Title with Start Task Button on the Right
// // // // //             Row(
// // // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: Text(
// // // // //                     widget.taskTitle,
// // // // //                     style: TextStyle(
// // // // //                       fontSize: screenWidth > 600 ? 18 : 16,
// // // // //                       fontWeight: FontWeight.bold,
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //                 // ElevatedButton(
// // // // //                 //   onPressed: () {},
// // // // //                 //   style: ElevatedButton.styleFrom(
// // // // //                 //     backgroundColor: Colors.purple,
// // // // //                 //     shape: RoundedRectangleBorder(
// // // // //                 //       borderRadius: BorderRadius.circular(8),
// // // // //                 //     ),
// // // // //                 //   ),
// // // // //                 //   child: const Text('Start task'),
// // // // //                 // ),
// // // // //                 ElevatedButton(
// // // // //                   onPressed: () {
// // // // //                     setState(() {
// // // // //                       if (isTaskStarted) {
// // // // //                         // Task is stopped
// // // // //                         isTaskStarted = false;
// // // // //                         isTaskCompleted = true;
// // // // //                       } else {
// // // // //                         // Task is started
// // // // //                         isTaskStarted = true;
// // // // //                         isTaskCompleted = false;
// // // // //                       }
// // // // //                     });
// // // // //                   },
// // // // //                   style: ElevatedButton.styleFrom(
// // // // //                     backgroundColor: isTaskStarted ? Colors.red : Colors.purple,
// // // // //                     shape: RoundedRectangleBorder(
// // // // //                       borderRadius: BorderRadius.circular(8),
// // // // //                     ),
// // // // //                   ),
// // // // //                   child: Text(
// // // // //                     isTaskStarted ? 'Stop Task' : 'Start Task',
// // // // //                     style: const TextStyle(color: Colors.white),
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             const SizedBox(height: 8),

// // // // //             // Task Description with "Show More"/"Show Less"
// // // // //             Text(
// // // // //               widget.isExpanded
// // // // //                   ? widget.taskDescription
// // // // //                   : '${widget.taskDescription.split("\n")[0]}\n${widget.taskDescription.split("\n")[1].substring(0, 25)}...', // Show limited text when collapsed
// // // // //               style: TextStyle(
// // // // //                 fontSize: screenWidth > 600 ? 16 : 14,
// // // // //               ),
// // // // //             ),
// // // // //             const SizedBox(height: 8),
// // // // //             GestureDetector(
// // // // //               onTap: widget.onToggle,
// // // // //               child: Text(
// // // // //                 widget.isExpanded ? 'Show Less' : 'Show More',
// // // // //                 style: const TextStyle(
// // // // //                   color: Colors.blue,
// // // // //                   fontWeight: FontWeight.bold,
// // // // //                 ),
// // // // //               ),
// // // // //             ),

// // // // //             const SizedBox(height: 12),

// // // // //             // Task Completed Checkbox
// // // // //             //  isTaskStarted ? Column(children: [
// // // // //             //   Divider(color: Colors.purple,
// // // // //             //   ),

// // // // //             //  ],) :   Row(
// // // // //             //       children: [
// // // // //             //         Checkbox(
// // // // //             //           value: widget.isTaskCompleted,
// // // // //             //           onChanged: (value) {},
// // // // //             //         ),
// // // // //             //         const Text('Task completed'),
// // // // //             //       ],
// // // // //             //     ),

// // // // //             isTaskStarted
// // // // //                 ? Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     children: [
// // // // //                       // Divider
// // // // //                       const Divider(
// // // // //                         color: Colors.purple,
// // // // //                         thickness: 2,
// // // // //                         height: 20,
// // // // //                       ),
// // // // //                       SizedBox(height: 3,),
// // // // //                       Row(
// // // // //                         children: [
// // // // //                           SizedBox(width: 10,),
// // // // //                           Text(
// // // // //                             "Active task : ",
// // // // //                             style: TextStyle(
// // // // //                                 color: Colors.black,
// // // // //                                 fontWeight: FontWeight.bold,
// // // // //                                 fontSize: 17),
// // // // //                           ),
// // // // //                           Text(
// // // // //                             " Design the Home Page",
// // // // //                             style:
// // // // //                                 TextStyle(color: Colors.purple, fontSize: 17),
// // // // //                           )
// // // // //                         ],
// // // // //                       ),
// // // // //                       SizedBox(height: 10,),
// // // // //                       // Active Task Section
// // // // //                       Column(
// // // // //                         mainAxisAlignment: MainAxisAlignment.start,
// // // // //                         crossAxisAlignment: CrossAxisAlignment.center,
// // // // //                         children: [
// // // // //                           Center(
// // // // //                             child: RichText(
// // // // //                                 text: TextSpan(text: "Started at ",
// // // // //                                     style: TextStyle(
// // // // //                                       fontSize: 17,
// // // // //                                       color: Colors.black
// // // // //                                     ),
// // // // //                                     children: [
// // // // //                                   TextSpan(text: "9:AM",
// // // // //                                       style:
// // // // //                                           TextStyle(fontWeight: FontWeight.bold,
// // // // //                                           fontSize: 17,
// // // // //                                           color: Colors.black))
// // // // //                                 ])),
// // // // //                           )
// // // // //                         ],
// // // // //                       ),


// // // // //                       SizedBox(
// // // // //                         height: 10,
// // // // //                       ),
// // // // //                       // Started Time
                   
// // // // //                       Center(   child:   const Icon(Icons.timer, size: 20),),
                    
// // // // //                       Center(
// // // // //                         child: const Text(
// // // // //                           "04:00:00",
// // // // //                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
// // // // //                         ),
// // // // //                       ),

// // // // //                       // Timer
                  

// // // // //                       // GPS Tracking
// // // // //                       Row(
// // // // //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                         children: [
// // // // //                           RichText(text: TextSpan(
// // // // //                             text:  "Gps tracking:",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w400),
// // // // //                             children: [
// // // // //                               TextSpan(text: "Active", style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.bold))
// // // // //                             ]
// // // // //                           ),
// // // // //                           ),
                          
// // // // //                           Row(children: [
// // // // //                                const Icon(Icons.location_pin,
// // // // //                               size: 20, color: Colors.red),
// // // // //                           const Text("Kaloor", style: TextStyle(fontSize: 20),),
// // // // //                           ],),
                      
                       
// // // // //                         ],

// // // // //                       ),

// // // // //                       // Map Placeholder (Replace with actual map widget if needed)
// // // // //                       Container(
// // // // //                         margin: const EdgeInsets.symmetric(vertical: 10),
// // // // //                         height: 200,
// // // // //                         color: Colors.black12,
// // // // //                         child: GoogleMap(
// // // // //                           initialCameraPosition: CameraPosition(
// // // // //                             target: LatLng(10.0104, 76.2939),
// // // // //                             zoom: 14, // Adjust zoom level as needed
// // // // //                           ),
// // // // //                           markers: {
// // // // //                             Marker(
// // // // //                               markerId: const MarkerId('kaloor_marker'),
// // // // //                               position:  LatLng(10.0104, 76.2939),
// // // // //                               infoWindow: const InfoWindow(title: "Kaloor"),
// // // // //                               icon: BitmapDescriptor.defaultMarkerWithHue(
// // // // //                                 BitmapDescriptor
// // // // //                                     .hueRed, // Red marker for the location
// // // // //                               ),
// // // // //                             ),
// // // // //                           },
// // // // //                         ),
// // // // //                       ),
// // // // //                     ],
// // // // //                   )
// // // // //                 : Row(
// // // // //                     children: [
// // // // //                       Checkbox(
// // // // //                         value: widget.isTaskCompleted,
// // // // //                         onChanged: (value) {
// // // // //                           // Handle checkbox state change
// // // // //                         },
// // // // //                       ),
// // // // //                       const Text('Task completed'),
// // // // //                     ],
// // // // //                   ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:time_sheet_app/view/showtaskpage.dart'; // Make sure to import ShowTaskPage

// // // class ProjectDetailedPage extends StatefulWidget {
// // //   final String title;
// // //   final String subtitle;

// // //   const ProjectDetailedPage({super.key, required this.title, required this.subtitle});

// // //   @override
// // //   _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
// // // }

// // // class _ProjectDetailedPageState extends State<ProjectDetailedPage> {
// // //   final List<bool> _isExpanded = [false, false]; // Track "Show More"/"Show Less" state for each task

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final screenWidth = MediaQuery.of(context).size.width;

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.purple,
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
// // //           onPressed: () {
// // //             Navigator.pop(context);
// // //           },
// // //         ),
// // //         title: Text(
// // //           widget.title,
// // //           style: const TextStyle(color: Colors.white),
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // Description Card
// // //             Card(
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(12),
// // //               ),
// // //               elevation: 3,
// // //               child: Padding(
// // //                 padding: const EdgeInsets.all(16.0),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       widget.title,
// // //                       style: TextStyle(
// // //                         fontSize: screenWidth > 600 ? 22 : 18,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 10),
// // //                     Text(
// // //                       widget.subtitle,
// // //                       style: TextStyle(fontSize: 14),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 20),

// // //             // Tasks Header
// // //             Text(
// // //               'Tasks',
// // //               style: TextStyle(
// // //                 fontSize: screenWidth > 600 ? 20 : 16,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 10),

// // //             // Task Cards
// // //             TaskCard(
// // //               taskTitle: 'Design the Home Page',
// // //               taskDescription:
// // //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// // //               isExpanded: _isExpanded[0],
// // //               onToggle: () {
// // //                 setState(() {
// // //                   _isExpanded[0] = !_isExpanded[0];
// // //                 });
// // //               },
// // //             ),
// // //             const SizedBox(height: 10),
// // //             TaskCard(
// // //               taskTitle: 'Design the "Pricing" Page',
// // //               taskDescription:
// // //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// // //               isExpanded: _isExpanded[1],
// // //               onToggle: () {
// // //                 setState(() {
// // //                   _isExpanded[1] = !_isExpanded[1];
// // //                 });
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class TaskCard extends StatefulWidget {
// // //   final String taskTitle;
// // //   final String taskDescription;
// // //   final bool isExpanded;
// // //   final VoidCallback onToggle;

// // //   const TaskCard({
// // //     required this.taskTitle,
// // //     required this.taskDescription,
// // //     required this.isExpanded,
// // //     required this.onToggle,
// // //   });

// // //   @override
// // //   _TaskCardState createState() => _TaskCardState();
// // // }

// // // class _TaskCardState extends State<TaskCard> {
// // //   String selectedStatus = "To Do";

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final screenWidth = MediaQuery.of(context).size.width;

// // //     return Card(
// // //       shape: RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.circular(12),
// // //       ),
// // //       elevation: 3,
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // Task Title
// // //             Text(
// // //               widget.taskTitle,
// // //               style: TextStyle(
// // //                 fontSize: screenWidth > 600 ? 18 : 16,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 8),

// // //             // Task Description with "Show More"/"Show Less"
// // //             Text(
// // //               widget.isExpanded
// // //                   ? widget.taskDescription
// // //                   : '${widget.taskDescription.split("\n")[0]}\n${widget.taskDescription.split("\n")[1].substring(0, 25)}...',
// // //               style: TextStyle(
// // //                 fontSize: screenWidth > 600 ? 16 : 14,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 8),
// // //             GestureDetector(
// // //               onTap: widget.onToggle,
// // //               child: Text(
// // //                 widget.isExpanded ? 'Show Less' : 'Show More',
// // //                 style: const TextStyle(
// // //                   color: Colors.blue,
// // //                   fontWeight: FontWeight.bold,
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 16),

// // //             // Buttons: Show Task and Status Dropdown
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 ElevatedButton(
// // //                   onPressed: () {
// // //                     // Navigate to ShowTaskPage with task title and description
// // //                     Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                         builder: (context) => ShowTaskPage(
// // //                           taskId: '1', // Task ID can be dynamic
// // //                           title: widget.taskTitle,
// // //                           description: widget.taskDescription, // Pass description
// // //                         ),
// // //                       ),
// // //                     );
// // //                   },
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: Colors.purple,
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                     ),
// // //                   ),
                 
// // //                   child: const Text('Show Task', style: TextStyle(color: Colors.white)),
// // //                 ),
// // //                 Column(children: [
// // //                   Text(
// // //                   "Status: TODO",
// // //                   style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black),
// // //                 ),
// // //                 SizedBox(height:15 ,),
// // //                 InkWell(child: Text("Comments",
            
// // //                  style: TextStyle(
// // //                   fontSize: screenWidth * 0.04, color: Colors.black


// // //                 ),),)
// // //                 ],),
// // //                 // Text(
// // //                 //   "Status: TODO",
// // //                 //   style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
// // //                 // ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }





// // // // import 'package:flutter/material.dart';
// // // // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // // // class ProjectDetailedPage extends StatefulWidget {
// // // //   final String title;
// // // //   final String subtitle;

// // // //   const ProjectDetailedPage(
// // // //       {super.key, required this.title, required this.subtitle});
// // // //   @override
// // // //   _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
// // // // }

// // // // class _ProjectDetailedPageState extends State<ProjectDetailedPage> {
// // // //   final List<bool> _isExpanded = [
// // // //     false,
// // // //     false
// // // //   ]; // Track "Show More"/"Show Less" state for each task

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final screenWidth = MediaQuery.of(context).size.width;

// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.purple,
// // // //         elevation: 0,
// // // //         leading: IconButton(
// // // //           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
// // // //           onPressed: () {
// // // //             Navigator.pop(context);
// // // //           },
// // // //         ),
// // // //         title: Text(
// // // //           widget.title,
// // // //           style: const TextStyle(color: Colors.white),
// // // //         ),
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             // Description Card
// // // //             Card(
// // // //               shape: RoundedRectangleBorder(
// // // //                 borderRadius: BorderRadius.circular(12),
// // // //               ),
// // // //               elevation: 3,
// // // //               child: Padding(
// // // //                 padding: const EdgeInsets.all(16.0),
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Text(
// // // //                       widget.title,
// // // //                       style: TextStyle(
// // // //                         fontSize: screenWidth > 600 ? 22 : 18,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 10),
// // // //                     // const Text(
// // // //                     //   'We need a visually appealing, user-friendly, and responsive design for the Home Page of our certificate issuing and validating platform. The page should effectively communicate the platform\'s purpose, features, and benefits to different target audiences (Companies, Partners, Brands, and General Public).',
// // // //                     //   style: TextStyle(fontSize: 14),
// // // //                     // ),
// // // //                     // const SizedBox(height: 8),
// // // //                     // const Text(
// // // //                     //   'The design should include interactive elements, intuitive navigation, and clear calls-to-action (CTAs). The goal is to create a high-conversion landing page that is both informative and engaging.',
// // // //                     //   style: TextStyle(fontSize: 14),
// // // //                     // ),
// // // //                     Text(
// // // //                       widget.subtitle,
// // // //                       style: TextStyle(fontSize: 14),
// // // //                     )
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 20),

// // // //             // Tasks Header
// // // //             Text(
// // // //               'Tasks',
// // // //               style: TextStyle(
// // // //                 fontSize: screenWidth > 600 ? 20 : 16,
// // // //                 fontWeight: FontWeight.bold,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 10),

// // // //             // Task Cards
// // // //             TaskCard(
// // // //               taskTitle: 'Design the Home Page',
// // // //               taskDescription:
// // // //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// // // //               isTaskCompleted: false,
// // // //               isExpanded: _isExpanded[0],
// // // //               onToggle: () {
// // // //                 setState(() {
// // // //                   _isExpanded[0] = !_isExpanded[0];
// // // //                 });
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 10),
// // // //             TaskCard(
// // // //               taskTitle: 'Design the "Pricing" Page',
// // // //               taskDescription:
// // // //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// // // //               isTaskCompleted: false,
// // // //               isExpanded: _isExpanded[1],
// // // //               onToggle: () {
// // // //                 setState(() {
// // // //                   _isExpanded[1] = !_isExpanded[1];
// // // //                 });
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class TaskCard extends StatefulWidget {
// // // //   final String taskTitle;
// // // //   final String taskDescription;
// // // //   final bool isTaskCompleted;
// // // //   final bool isExpanded;
// // // //   final VoidCallback onToggle;

// // // //   const TaskCard({
// // // //     required this.taskTitle,
// // // //     required this.taskDescription,
// // // //     this.isTaskCompleted = false,
// // // //     required this.isExpanded,
// // // //     required this.onToggle,
// // // //   });

// // // //   @override
// // // //   State<TaskCard> createState() => _TaskCardState();
// // // // }

// // // // class _TaskCardState extends State<TaskCard> {
// // // //   bool isTaskStarted = false;
// // // //   bool isTaskCompleted = false;
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final screenWidth = MediaQuery.of(context).size.width;

// // // //     return Card(
// // // //       shape: RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.circular(12),
// // // //       ),
// // // //       elevation: 3,
// // // //       child: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             // Task Title with Start Task Button on the Right
// // // //             Row(
// // // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: Text(
// // // //                     widget.taskTitle,
// // // //                     style: TextStyle(
// // // //                       fontSize: screenWidth > 600 ? 18 : 16,
// // // //                       fontWeight: FontWeight.bold,
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 // ElevatedButton(
// // // //                 //   onPressed: () {},
// // // //                 //   style: ElevatedButton.styleFrom(
// // // //                 //     backgroundColor: Colors.purple,
// // // //                 //     shape: RoundedRectangleBorder(
// // // //                 //       borderRadius: BorderRadius.circular(8),
// // // //                 //     ),
// // // //                 //   ),
// // // //                 //   child: const Text('Start task'),
// // // //                 // ),
// // // //                 ElevatedButton(
// // // //                   onPressed: () {
// // // //                     setState(() {
// // // //                       if (isTaskStarted) {
// // // //                         // Task is stopped
// // // //                         isTaskStarted = false;
// // // //                         isTaskCompleted = true;
// // // //                       } else {
// // // //                         // Task is started
// // // //                         isTaskStarted = true;
// // // //                         isTaskCompleted = false;
// // // //                       }
// // // //                     });
// // // //                   },
// // // //                   style: ElevatedButton.styleFrom(
// // // //                     backgroundColor: isTaskStarted ? Colors.red : Colors.purple,
// // // //                     shape: RoundedRectangleBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                     ),
// // // //                   ),
// // // //                   child: Text(
// // // //                     isTaskStarted ? 'Stop Task' : 'Start Task',
// // // //                     style: const TextStyle(color: Colors.white),
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             const SizedBox(height: 8),

// // // //             // Task Description with "Show More"/"Show Less"
// // // //             Text(
// // // //               widget.isExpanded
// // // //                   ? widget.taskDescription
// // // //                   : '${widget.taskDescription.split("\n")[0]}\n${widget.taskDescription.split("\n")[1].substring(0, 25)}...', // Show limited text when collapsed
// // // //               style: TextStyle(
// // // //                 fontSize: screenWidth > 600 ? 16 : 14,
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 8),
// // // //             GestureDetector(
// // // //               onTap: widget.onToggle,
// // // //               child: Text(
// // // //                 widget.isExpanded ? 'Show Less' : 'Show More',
// // // //                 style: const TextStyle(
// // // //                   color: Colors.blue,
// // // //                   fontWeight: FontWeight.bold,
// // // //                 ),
// // // //               ),
// // // //             ),

// // // //             const SizedBox(height: 12),

// // // //             // Task Completed Checkbox
// // // //             //  isTaskStarted ? Column(children: [
// // // //             //   Divider(color: Colors.purple,
// // // //             //   ),

// // // //             //  ],) :   Row(
// // // //             //       children: [
// // // //             //         Checkbox(
// // // //             //           value: widget.isTaskCompleted,
// // // //             //           onChanged: (value) {},
// // // //             //         ),
// // // //             //         const Text('Task completed'),
// // // //             //       ],
// // // //             //     ),

// // // //             isTaskStarted
// // // //                 ? Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       // Divider
// // // //                       const Divider(
// // // //                         color: Colors.purple,
// // // //                         thickness: 2,
// // // //                         height: 20,
// // // //                       ),
// // // //                       SizedBox(height: 3,),
// // // //                       Row(
// // // //                         children: [
// // // //                           SizedBox(width: 10,),
// // // //                           Text(
// // // //                             "Active task : ",
// // // //                             style: TextStyle(
// // // //                                 color: Colors.black,
// // // //                                 fontWeight: FontWeight.bold,
// // // //                                 fontSize: 17),
// // // //                           ),
// // // //                           Text(
// // // //                             " Design the Home Page",
// // // //                             style:
// // // //                                 TextStyle(color: Colors.purple, fontSize: 17),
// // // //                           )
// // // //                         ],
// // // //                       ),
// // // //                       SizedBox(height: 10,),
// // // //                       // Active Task Section
// // // //                       Column(
// // // //                         mainAxisAlignment: MainAxisAlignment.start,
// // // //                         crossAxisAlignment: CrossAxisAlignment.center,
// // // //                         children: [
// // // //                           Center(
// // // //                             child: RichText(
// // // //                                 text: TextSpan(text: "Started at ",
// // // //                                     style: TextStyle(
// // // //                                       fontSize: 17,
// // // //                                       color: Colors.black
// // // //                                     ),
// // // //                                     children: [
// // // //                                   TextSpan(text: "9:AM",
// // // //                                       style:
// // // //                                           TextStyle(fontWeight: FontWeight.bold,
// // // //                                           fontSize: 17,
// // // //                                           color: Colors.black))
// // // //                                 ])),
// // // //                           )
// // // //                         ],
// // // //                       ),


// // // //                       SizedBox(
// // // //                         height: 10,
// // // //                       ),
// // // //                       // Started Time
                   
// // // //                       Center(   child:   const Icon(Icons.timer, size: 20),),
                    
// // // //                       Center(
// // // //                         child: const Text(
// // // //                           "04:00:00",
// // // //                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
// // // //                         ),
// // // //                       ),

// // // //                       // Timer
                  

// // // //                       // GPS Tracking
// // // //                       Row(
// // // //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                         children: [
// // // //                           RichText(text: TextSpan(
// // // //                             text:  "Gps tracking:",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w400),
// // // //                             children: [
// // // //                               TextSpan(text: "Active", style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.bold))
// // // //                             ]
// // // //                           ),
// // // //                           ),
                          
// // // //                           Row(children: [
// // // //                                const Icon(Icons.location_pin,
// // // //                               size: 20, color: Colors.red),
// // // //                           const Text("Kaloor", style: TextStyle(fontSize: 20),),
// // // //                           ],),
                      
                       
// // // //                         ],

// // // //                       ),

// // // //                       // Map Placeholder (Replace with actual map widget if needed)
// // // //                       Container(
// // // //                         margin: const EdgeInsets.symmetric(vertical: 10),
// // // //                         height: 200,
// // // //                         color: Colors.black12,
// // // //                         child: GoogleMap(
// // // //                           initialCameraPosition: CameraPosition(
// // // //                             target: LatLng(10.0104, 76.2939),
// // // //                             zoom: 14, // Adjust zoom level as needed
// // // //                           ),
// // // //                           markers: {
// // // //                             Marker(
// // // //                               markerId: const MarkerId('kaloor_marker'),
// // // //                               position:  LatLng(10.0104, 76.2939),
// // // //                               infoWindow: const InfoWindow(title: "Kaloor"),
// // // //                               icon: BitmapDescriptor.defaultMarkerWithHue(
// // // //                                 BitmapDescriptor
// // // //                                     .hueRed, // Red marker for the location
// // // //                               ),
// // // //                             ),
// // // //                           },
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   )
// // // //                 : Row(
// // // //                     children: [
// // // //                       Checkbox(
// // // //                         value: widget.isTaskCompleted,
// // // //                         onChanged: (value) {
// // // //                           // Handle checkbox state change
// // // //                         },
// // // //                       ),
// // // //                       const Text('Task completed'),
// // // //                     ],
// // // //                   ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // import 'package:flutter/material.dart';
// // import 'package:time_sheet_app/view/add_comment_page.dart';
// // import 'package:time_sheet_app/view/showtaskpage.dart'; // Make sure to import ShowTaskPage

// // class ProjectDetailedPage extends StatefulWidget {
// //   final String title;
// //   final String subtitle;

// //   const ProjectDetailedPage({super.key, required this.title, required this.subtitle});

// //   @override
// //   _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
// // }

// // class _ProjectDetailedPageState extends State<ProjectDetailedPage> {
// //   final List<bool> _isExpanded = [false, false]; // Track "Show More"/"Show Less" state for each task

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.purple,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: Text(
// //           widget.title,
// //           style: const TextStyle(color: Colors.white),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Description Card
// //             Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               elevation: 3,
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       widget.title,
// //                       style: TextStyle(
// //                         fontSize: screenWidth > 600 ? 22 : 18,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10),
// //                     Text(
// //                       widget.subtitle,
// //                       style: TextStyle(fontSize: 14),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 20),

// //             // Tasks Header
// //             Text(
// //               'Tasks',
// //               style: TextStyle(
// //                 fontSize: screenWidth > 600 ? 20 : 16,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 10),

// //             // Task Cards
// //             TaskCard(
// //               taskTitle: 'Design the Home Page',
// //               taskDescription:
// //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// //               isExpanded: _isExpanded[0],
// //               onToggle: () {
// //                 setState(() {
// //                   _isExpanded[0] = !_isExpanded[0];
// //                 });
// //               },
// //             ),
// //             const SizedBox(height: 10),
// //             TaskCard(
// //               taskTitle: 'Design the "Pricing" Page',
// //               taskDescription:
// //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// //               isExpanded: _isExpanded[1],
// //               onToggle: () {
// //                 setState(() {
// //                   _isExpanded[1] = !_isExpanded[1];
// //                 });
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class TaskCard extends StatefulWidget {
// //   final String taskTitle;
// //   final String taskDescription;
// //   final bool isExpanded;
// //   final VoidCallback onToggle;

// //   const TaskCard({
// //     required this.taskTitle,
// //     required this.taskDescription,
// //     required this.isExpanded,
// //     required this.onToggle,
// //   });

// //   @override
// //   _TaskCardState createState() => _TaskCardState();
// // }

// // class _TaskCardState extends State<TaskCard> {
// //   String selectedStatus = "To Do";

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     return Card(
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       elevation: 3,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Task Title
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   widget.taskTitle,
// //                   style: TextStyle(
// //                     fontSize: screenWidth > 600 ? 18 : 16,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),   
// //             RichText(
// //           text: TextSpan(
// //             text: 'Status: ',
// //             style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.black),
// //             children: [
// //               TextSpan(
// //                 text: 'Todo',
// //                 style: TextStyle(color: Colors.red, fontSize: screenWidth*0.03)
// //               ),
// //             ],
// //           ),
// //         ),

// //                 //  Text(
// //                 //   "Status: TODO",
// //                 //   style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black),
// //                 // ),

// //               ],
// //             ),
// //             const SizedBox(height: 8),

// //             // Task Description with "Show More"/"Show Less"
// //             Text(
// //               widget.isExpanded
// //                   ? widget.taskDescription
// //                   : '${widget.taskDescription.split("\n")[0]}\n${widget.taskDescription.split("\n")[1].substring(0, 25)}...',
// //               style: TextStyle(
// //                 fontSize: screenWidth > 600 ? 16 : 14,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             GestureDetector(
// //               onTap: widget.onToggle,
// //               child: Text(
// //                 widget.isExpanded ? 'Show Less' : 'Show More',
// //                 style: const TextStyle(
// //                   color: Colors.blue,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),

// //             // Buttons: Show Task and Status Dropdown
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     // Navigate to ShowTaskPage with task title and description
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => ShowTaskPage(
// //                           taskId: '1', // Task ID can be dynamic
// //                           title: widget.taskTitle,
// //                           description: widget.taskDescription, // Pass description
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.purple,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                   ),
                 
// //                   child: const Text('Show Task', style: TextStyle(color: Colors.white)),
// //                 ),
// //                 SizedBox(height:15 ,),
// //                 InkWell(
// //                    onTap: () {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         // builder: (context) => AddCommentsPage(taskTitle: widget.taskTitle),
// //         builder: (context) => CommentsPage(),

// //       ),
// //     );
// //   },
// //                   child: Text("Comments",
            
// //                  style: TextStyle(
// //                   fontSize: screenWidth * 0.04, color: Colors.black


// //                 ),),)
               
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



// // import 'package:flutter/material.dart';
// // import 'package:time_sheet_app/view/add_comment_page.dart';
// // import 'package:time_sheet_app/view/showtaskpage.dart'; // Make sure to import ShowTaskPage

// // class ProjectDetailedPage extends StatefulWidget {
// //   final String title;
// //   final String subtitle;

// //   const ProjectDetailedPage({super.key, required this.title, required this.subtitle});

// //   @override
// //   _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
// // }

// // class _ProjectDetailedPageState extends State<ProjectDetailedPage> {
// //   final List<bool> _isExpanded = [false, false]; // Track "Show More"/"Show Less" state for each task

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.purple,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: Text(
// //           widget.title,
// //           style: const TextStyle(color: Colors.white),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Description Card
// //             Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               elevation: 3,
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       widget.title,
// //                       style: TextStyle(
// //                         fontSize: screenWidth > 600 ? 22 : 18,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10),
// //                     Text(
// //                       widget.subtitle,
// //                       style: TextStyle(fontSize: 14),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 20),

// //             // Tasks Header
// //             Text(
// //               'Tasks',
// //               style: TextStyle(
// //                 fontSize: screenWidth > 600 ? 20 : 16,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 10),

// //             // Task Cards
// //             TaskCard(
// //               taskTitle: 'Design the Home Page',
// //               taskDescription:
// //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// //               isExpanded: _isExpanded[0],
// //               onToggle: () {
// //                 setState(() {
// //                   _isExpanded[0] = !_isExpanded[0];
// //                 });
// //               },
// //             ),
// //             const SizedBox(height: 10),
// //             TaskCard(
// //               taskTitle: 'Design the "Pricing" Page',
// //               taskDescription:
// //                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
// //               isExpanded: _isExpanded[1],
// //               onToggle: () {
// //                 setState(() {
// //                   _isExpanded[1] = !_isExpanded[1];
// //                 });
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class TaskCard extends StatefulWidget {
// //   final String taskTitle;
// //   final String taskDescription;
// //   final bool isExpanded;
// //   final VoidCallback onToggle;

// //   const TaskCard({
// //     required this.taskTitle,
// //     required this.taskDescription,
// //     required this.isExpanded,
// //     required this.onToggle,
// //   });

// //   @override
// //   _TaskCardState createState() => _TaskCardState();
// // }

// // class _TaskCardState extends State<TaskCard> {
// //   String selectedStatus = "To Do";

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     return Card(
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       elevation: 3,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Task Title
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   widget.taskTitle,
// //                   style: TextStyle(
// //                     fontSize: screenWidth > 600 ? 18 : 16,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     // Navigate to ShowTaskPage with task title and description
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => ShowTaskPage(
// //                           taskId: '1', // Task ID can be dynamic
// //                           title: widget.taskTitle,
// //                           description: widget.taskDescription, // Pass description
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.purple,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                   ),
// //                   child: const Text('Show Task', style: TextStyle(color: Colors.white)),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 8),

// //             // Task Description with "Show More"/"Show Less"
// //             Text(
// //               widget.isExpanded
// //                   ? widget.taskDescription
// //                   : '${widget.taskDescription.split("\n")[0]}\n${widget.taskDescription.split("\n")[1].substring(0, 25)}...',
// //               style: TextStyle(
// //                 fontSize: screenWidth > 600 ? 16 : 14,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             GestureDetector(
// //               onTap: widget.onToggle,
// //               child: Text(
// //                 widget.isExpanded ? 'Show Less' : 'Show More',
// //                 style: const TextStyle(
// //                   color: Colors.blue,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),

// //             // Buttons: Status Dropdown and Comments
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 RichText(
// //                   text: TextSpan(
// //                     text: 'Status: ',
// //                     style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black38,
// //                     ),
// //                     children: [
// //                       TextSpan(
// //                         text: selectedStatus,
// //                         style: TextStyle(color: Colors.red, fontSize: screenWidth * 0.03),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 InkWell(
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => CommentsPage(),
// //                       ),
// //                     );
// //                   },
// //                   child: Text(
// //                     "Comments",
// //                     style: TextStyle(
// //                       fontSize: screenWidth * 0.04, color: Colors.black38,
// //                     ),
// //                   ),
// //                 )
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/view/add_comment_page.dart';
// import 'package:time_sheet_app/view/showtaskpage.dart';
// import 'package:time_sheet_app/features/Project_details/service/Project_task_service.dart';
// import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';

// // Provider to fetch tasks from API
// final taskProvider = FutureProvider<List<TaskModel>>((ref) async {
//   final taskService = ref.read(projectTaskServiceProvider);
//   const token = 'your-token-here'; // Replace with dynamic token retrieval
//   const projectId = 1; // Replace with dynamic project ID
//   const employeeId = 7; // Replace with dynamic employee ID
//   final result = await taskService.getTask(token, projectId, employeeId);
//   return result.fold((failure) => [], (tasks) => tasks);
// });

// // Provider to manage the expanded state for tasks
// final expandedTaskProvider = StateProvider<List<bool>>((ref) => []);

// class ProjectDetailedPage extends ConsumerWidget {
//   final String title;
//   final String subtitle;

//   const ProjectDetailedPage(
//       {super.key, required this.title, required this.subtitle});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final taskAsyncValue = ref.watch(taskProvider);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           title,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//       body: taskAsyncValue.when(
//         data: (tasks) {
//           if (tasks.isEmpty) {
//             return const Center(child: Text('You don’t have any tasks'));
//           }

//           // Initialize expanded state based on the number of tasks
//           ref.read(expandedTaskProvider.notifier).state =
//               List.generate(tasks.length, (_) => false);
//           final isExpanded = ref.watch(expandedTaskProvider);

//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Description Card
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 3,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: TextStyle(
//                             fontSize: screenWidth > 600 ? 22 : 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           subtitle,
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Tasks Header
//                 Text(
//                   'Tasks',
//                   style: TextStyle(
//                     fontSize: screenWidth > 600 ? 20 : 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),

//                 // Task Cards
//                 ...tasks.asMap().entries.map((entry) {
//                   final index = entry.key;
//                   final task = entry.value;
//                   return Column(
//                     children: [
//                       TaskCard(
//                         taskTitle: task.title,
//                         taskDescription: task.description,
//                         isExpanded: isExpanded[index],
//                         onToggle: () {
//                           final expandedState =
//                               ref.read(expandedTaskProvider.notifier).state;
//                           expandedState[index] = !expandedState[index];
//                           ref.read(expandedTaskProvider.notifier).state = [
//                             ...expandedState
//                           ];
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   );
//                 }).toList(),
//               ],
//             ),
//           );
//         },
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, _) => Center(child: Text('Error: $error')),
//       ),
//     );
//   }
// }

// class TaskCard extends ConsumerWidget {
//   final String taskTitle;
//   final String taskDescription;
//   final bool isExpanded;
//   final VoidCallback onToggle;

//   const TaskCard({
//     required this.taskTitle,
//     required this.taskDescription,
//     required this.isExpanded,
//     required this.onToggle,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final selectedStatus = ref.watch(selectedStatusProvider(taskTitle));

//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Task Title
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   taskTitle,
//                   style: TextStyle(
//                     fontSize: screenWidth > 600 ? 18 : 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigate to ShowTaskPage with task title and description
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ShowTaskPage(
//                           taskId: '1', // Task ID can be dynamic
//                           title: taskTitle,
//                           description: taskDescription, // Pass description
//                         ),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text('Show Task',
//                       style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             // Task Description with "Show More"/"Show Less"
//             Text(
//               isExpanded
//                   ? taskDescription
//                   : '${taskDescription.split("\n")[0]}\n${taskDescription.split("\n")[1].substring(0, 25)}...',
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 16 : 14,
//               ),
//             ),
//             const SizedBox(height: 8),
//             GestureDetector(
//               onTap: onToggle,
//               child: Text(
//                 isExpanded ? 'Show Less' : 'Show More',
//                 style: const TextStyle(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             // Buttons: Status Dropdown and Comments
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     text: 'Status: ',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       color: Colors.black38,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: selectedStatus,
//                         style: TextStyle(
//                             color: Colors.red, fontSize: screenWidth * 0.03),
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CommentsPage(),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     "Comments",
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.04,
//                       color: Colors.black38,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final selectedStatusProvider =
//     StateProvider.family<String, String>((ref, taskTitle) => "To Do");


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/view/add_comment_page.dart';
// import 'package:time_sheet_app/view/showtaskpage.dart';
// import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
// import 'package:time_sheet_app/features/Project_details/provider/task_provider.dart';

// class ProjectDetailedPage extends ConsumerWidget {
//   final String title;
//   final String subtitle;

//   const ProjectDetailedPage({
//     super.key,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final taskAsyncValue = ref.watch(taskProvider);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           title,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//       body: taskAsyncValue.when(
//         data: (tasks) {
//           if (tasks.isEmpty) {
//             return const Center(child: Text('You don’t have any tasks'));
//           }

//           // Initialize expanded state based on the number of tasks
//           ref.read(expandedTaskProvider.notifier).state =
//               List.generate(tasks.length, (_) => false);
//           final isExpanded = ref.watch(expandedTaskProvider);

//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Description Card
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 3,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: TextStyle(
//                             fontSize: screenWidth > 600 ? 22 : 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           subtitle,
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Tasks Header
//                 Text(
//                   'Tasks',
//                   style: TextStyle(
//                     fontSize: screenWidth > 600 ? 20 : 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),

//                 // Task Cards
//                 ...tasks.asMap().entries.map((entry) {
//                   final index = entry.key;
//                   final task = entry.value;
//                   return Column(
//                     children: [
//                       TaskCard(
//                         taskTitle: task.title,
//                         taskDescription: task.description,
//                         isExpanded: isExpanded[index],
//                         onToggle: () {
//                           final expandedState =
//                               ref.read(expandedTaskProvider.notifier).state;
//                           expandedState[index] = !expandedState[index];
//                           ref.read(expandedTaskProvider.notifier).state = [
//                             ...expandedState
//                           ];
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   );
//                 }).toList(),
//               ],
//             ),
//           );
//         },
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, _) => Center(child: Text('Error: $error')),
//       ),
//     );
//   }
// }

// class TaskCard extends StatelessWidget {
//   final String taskTitle;
//   final String taskDescription;
//   final bool isExpanded;
//   final VoidCallback onToggle;

//   const TaskCard({
//     super.key,
//     required this.taskTitle,
//     required this.taskDescription,
//     required this.isExpanded,
//     required this.onToggle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Task Title
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   taskTitle,
//                   style: TextStyle(
//                     fontSize: screenWidth > 600 ? 18 : 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ShowTaskPage(
//                           taskId: '1', // Replace with dynamic task ID
//                           title: taskTitle,
//                           description: taskDescription,
//                         ),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     'Show Task',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             // Task Description
//             Text(
//               isExpanded
//                   ? taskDescription
//                   : '${taskDescription.substring(0, 50)}...', // Show truncated description
//               style: const TextStyle(fontSize: 14),
//             ),
//             const SizedBox(height: 8),

//             // Show More / Show Less Toggle
//             GestureDetector(
//               onTap: onToggle,
//               child: Text(
//                 isExpanded ? 'Show Less' : 'Show More',
//                 style: const TextStyle(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
