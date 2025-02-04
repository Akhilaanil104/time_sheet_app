
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:time_sheet_app/common/shared_pref_provider.dart';
// import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
// import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// class ShowTaskPage extends ConsumerStatefulWidget {
//   final String taskId;
//   final String title;
//   final String description;

//   const ShowTaskPage({
//     Key? key,
//     required this.taskId,
//     required this.title,
//     required this.description,
//   }) : super(key: key);

//   @override
//   ConsumerState<ShowTaskPage> createState() => _ShowTaskPageState();
// }

// class _ShowTaskPageState extends ConsumerState<ShowTaskPage> {
//   bool isTaskStarted = false;
//   final startTime = DateTime.now();
//   String taskStartTime = '';
//   Timer? _timer;
//   Duration _elapsedTime = Duration.zero;
  
//   // Dynamic location fields
//   String currentLocation = '';
//   double currentLatitude = 0.0;
//   double currentLongitude = 0.0;
//   String state = '';
//   String city = '';
//   String street = '';
//   String country = '';
//   String postalCode = '';
  
//   String taskStatus = 'To Do';

//   @override
//   void dispose() {
//     _stopTimer();
//     super.dispose();
//   }

//   Future<void> _getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return;
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark place = placemarks.first;

//     setState(() {
//       currentLatitude = position.latitude;
//       currentLongitude = position.longitude;
//       street = place.street ?? "Unknown Street";
//       city = place.locality ?? "Unknown City";
//       state = place.administrativeArea ?? "Unknown State";
//       country = place.country ?? "Unknown Country";
//       postalCode = place.postalCode ?? "000000";
//       currentLocation = "$street, $city, $state, $country";
//     });
//   }

//   Future<void> _startStopTask(BuildContext context) async {
//     final timesheetCreateProvider = ref.read(timesheetCreationProvider.notifier);

//     if (!isTaskStarted) {
//       await _getLocation();

//       setState(() {
//         isTaskStarted = true;
//         showSuccessSnackbar(message: "Task Started", context: context);
//         taskStartTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
//         _elapsedTime = Duration.zero;
//       });

//       if (taskStartTime.isNotEmpty) {
//         final timesheetData = TimeSheetModel(
//           taskAssignmentId: int.parse(widget.taskId),
//           startTimestamp: startTime,
//           endTimestamp: DateTime.now(),
//           startLocation: currentLocation,
//           endLocation: currentLocation,
//           description: 'Task is started',
//           status: 'ONGOING',
//           state: state,
//           city: city,
//           street: street,
//           country: country,
//           postalCode: postalCode,
//           currentLongitude: currentLongitude,
//           currentLatitude: currentLatitude,
//         );

//         await timesheetCreateProvider.postTimesheet(
//           context: context,
//           timesheetData: timesheetData,
//         );
//       }
//       _startTimer();
//     } else {
//       setState(() {
//         isTaskStarted = false;
//         showSuccessSnackbar(
//             message: "Timesheet updated successfully", context: context);
//       });

//       _stopTimer();
//     }
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _elapsedTime += const Duration(seconds: 1);
//       });
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   String _formatElapsedTime(Duration elapsedTime) {
//     final hours = elapsedTime.inHours.toString().padLeft(2, '0');
//     final minutes = (elapsedTime.inMinutes % 60).toString().padLeft(2, '0');
//     final seconds = (elapsedTime.inSeconds % 60).toString().padLeft(2, '0');
//     return '$hours:$minutes:$seconds';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: Text(
//           widget.title,
//           style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(screenWidth * 0.04),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 3,
//               child: Padding(
//                 padding: EdgeInsets.all(screenWidth * 0.04),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Task ID: ${widget.taskId}",
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.04,
//                       ),
//                     ),
//                     SizedBox(height: screenWidth * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             widget.title,
//                             style: TextStyle(
//                               fontSize: screenWidth * 0.05,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () => _startStopTask(context),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 isTaskStarted ? Colors.red : Colors.purple,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: Text(
//                             isTaskStarted ? 'Stop Task' : 'Start Task',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: screenWidth * 0.04),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: screenWidth * 0.02),
//                     Text(
//                       widget.description,
//                       style: TextStyle(fontSize: screenWidth * 0.04),
//                     ),
//                     SizedBox(height: screenWidth * 0.05),
//                     if (isTaskStarted)
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Divider(
//                             color: Colors.purple,
//                             thickness: 2,
//                             height: 20,
//                           ),
//                           // SizedBox(height: screenWidth * 0.02),
//                           // Row(
//                           //   children: [
//                           //     SizedBox(width: screenWidth * 0.02),
//                           //     Text(
//                           //       "Started at: ",
//                           //       style: TextStyle(
//                           //           color: Colors.black,
//                           //           fontWeight: FontWeight.bold,
//                           //           fontSize: screenWidth * 0.045),
//                           //     ),
//                           //     Text(
//                           //       taskStartTime,
//                           //       style: TextStyle(
//                           //           color: Colors.purple,
//                           //           fontSize: screenWidth * 0.045),
//                           //     )
//                           //   ],
//                           // ),


//                           SizedBox(height: screenWidth * 0.02),
//                           Row(
//                             children: [
//                               SizedBox(width: screenWidth * 0.02),
//                               Text(
//                                 "Active task : ",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: screenWidth * 0.045),
//                               ),
//                               Text(
//                                 widget.title,
//                                 style: TextStyle(
//                                     color: Colors.purple,
//                                     fontSize: screenWidth * 0.045),
//                               )
//                             ],
//                           ),
//                           SizedBox(height: screenWidth * 0.02),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Center(
//                                 child: RichText(
//                                     text: TextSpan(
//                                         text: "Started at ",
//                                         style: TextStyle(
//                                             fontSize: screenWidth * 0.04,
//                                             color: Colors.black),
//                                         children: [
//                                       TextSpan(
//                                           text: " $taskStartTime",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: screenWidth * 0.04,
//                                               color: Colors.black))
//                                     ])),
//                               )
//                             ],
//                           ),
//                           // SizedBox(height: screenWidth * 0.02),
//                           // Center(
//                           //   child: const Icon(Icons.timer, size: 20),
//                           // ),
//                           // Center(
//                           //   child: Text(
//                           //     " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
//                           //     style: TextStyle(
//                           //         fontWeight: FontWeight.bold,
//                           //         fontSize: screenWidth * 0.045),
//                           //   ),
//                           // ),


//                            SizedBox(height: 20),
//             // Circular progress indicator with elapsed time
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Circular progress
//                   SizedBox(
//                     width: 150,
//                     height: 150,
//                     child: CircularProgressIndicator(
//                       value: _elapsedTime.inSeconds / 3600, // Progress percentage (assuming 1 hour task)
//                       strokeWidth: 8,
//                       backgroundColor: Colors.grey.shade300,
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                         Colors.purple, // Progress color
//                       ),
//                     ),
//                   ),
//                   // Center content inside the circle
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Elapsed time in "hr min" format
//                       Text(
//                         '${_elapsedTime.inHours} hr ${_elapsedTime.inMinutes % 60} min',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       // Clock icon
//                       Icon(
//                         Icons.access_time,
//                         size: 24,
//                         color: Colors.grey,
//                       ),
//                       SizedBox(height: 5),
//                       // Elapsed time in "hh:mm:ss" format
//                       Text(
//                         _formatElapsedTime(_elapsedTime),
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//                           SizedBox(height: screenWidth * 0.05),
//                           Text(
//                             'Status',
//                             style: TextStyle(
//                                 fontSize: screenWidth * 0.05,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: screenWidth * 0.03),
//                           DropdownButtonFormField<String>(
//                             value: taskStatus,
//                             items: [
//                               'To Do',
//                               'In Progress',
//                               'Under Review',
//                               'On Going',
//                               'Completed'
//                             ]
//                                 .map((status) => DropdownMenuItem(
//                                       value: status,
//                                       child: Text(status,
//                                           style: TextStyle(
//                                               fontSize: screenWidth * 0.04)),
//                                     ))
//                                 .toList(),
                                
//                             onChanged: (value) async  {
//                               setState(() {
//                                 taskStatus = value!;
                                
                                
//                               });
//                             },
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),

//                         ]
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }