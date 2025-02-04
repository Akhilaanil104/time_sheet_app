
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'dart:async';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
// // import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// // class ShowTaskPage extends ConsumerStatefulWidget {
// //   final String taskId;
// //   final String title;
// //   final String description;

// //   const ShowTaskPage({
// //     Key? key,
// //     required this.taskId,
// //     required this.title,
// //     required this.description,
// //   }) : super(key: key);

// //   @override
// //   ConsumerState<ShowTaskPage> createState() => _ShowTaskPageState();
// // }

// // class _ShowTaskPageState extends ConsumerState<ShowTaskPage> {
// //   bool isTaskStarted = false;
// //   final startTime = DateTime.now();
// //   String taskStartTime = '';
// //   Timer? _timer;
// //   Duration _elapsedTime = Duration.zero;
  
// //   // Dynamic location fields
// //   String currentLocation = '';
// //   double currentLatitude = 0.0;
// //   double currentLongitude = 0.0;
// //   String state = '';
// //   String city = '';
// //   String street = '';
// //   String country = '';
// //   String postalCode = '';
  
// //   String taskStatus = 'To Do';

// //   @override
// //   void dispose() {
// //     _stopTimer();
// //     super.dispose();
// //   }

// //   Future<void> _getLocation() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;

// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       return;
// //     }

// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         return;
// //       }
// //     }

// //     if (permission == LocationPermission.deniedForever) {
// //       return;
// //     }

// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);

// //     List<Placemark> placemarks =
// //         await placemarkFromCoordinates(position.latitude, position.longitude);
// //     Placemark place = placemarks.first;

// //     setState(() {
// //       currentLatitude = position.latitude;
// //       currentLongitude = position.longitude;
// //       street = place.street ?? "Unknown Street";
// //       city = place.locality ?? "Unknown City";
// //       state = place.administrativeArea ?? "Unknown State";
// //       country = place.country ?? "Unknown Country";
// //       postalCode = place.postalCode ?? "000000";
// //       currentLocation = "$street, $city, $state, $country";
// //     });
// //   }

// //   Future<void> _startStopTask(BuildContext context) async {
// //     final timesheetCreateProvider = ref.read(timesheetCreationProvider.notifier);

// //     if (!isTaskStarted) {
// //       await _getLocation();

// //       setState(() {
// //         isTaskStarted = true;
// //         showSuccessSnackbar(message: "Task Started", context: context);
// //         taskStartTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// //         _elapsedTime = Duration.zero;
// //       });

// //       if (taskStartTime.isNotEmpty) {
// //         final timesheetData = TimeSheetModel(
// //           taskAssignmentId: int.parse(widget.taskId),
// //           startTimestamp: startTime,
// //           endTimestamp: DateTime.now(),
// //           startLocation: currentLocation,
// //           endLocation: currentLocation,
// //           description: 'Task is started',
// //           status: 'ONGOING',
// //           state: state,
// //           city: city,
// //           street: street,
// //           country: country,
// //           postalCode: postalCode,
// //           currentLongitude: currentLongitude,
// //           currentLatitude: currentLatitude,
// //         );

// //         await timesheetCreateProvider.postTimesheet(
// //           context: context,
// //           timesheetData: timesheetData,
// //         );
// //       }
// //       _startTimer();
// //     } else {
// //       setState(() {
// //         isTaskStarted = false;
// //         showSuccessSnackbar(
// //             message: "Timesheet updated successfully", context: context);
// //       });

// //       _stopTimer();
// //     }
// //   }

// //   void _startTimer() {
// //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //       setState(() {
// //         _elapsedTime += const Duration(seconds: 1);
// //       });
// //     });
// //   }

// //   void _stopTimer() {
// //     _timer?.cancel();
// //     _timer = null;
// //   }

// //   String _formatElapsedTime(Duration elapsedTime) {
// //     final hours = elapsedTime.inHours.toString().padLeft(2, '0');
// //     final minutes = (elapsedTime.inMinutes % 60).toString().padLeft(2, '0');
// //     final seconds = (elapsedTime.inSeconds % 60).toString().padLeft(2, '0');
// //     return '$hours:$minutes:$seconds';
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.purple,
// //         title: Text(
// //           widget.title,
// //           style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(screenWidth * 0.04),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               elevation: 3,
// //               child: Padding(
// //                 padding: EdgeInsets.all(screenWidth * 0.04),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       "Task ID: ${widget.taskId}",
// //                       style: TextStyle(
// //                         fontSize: screenWidth * 0.04,
// //                       ),
// //                     ),
// //                     SizedBox(height: screenWidth * 0.02),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Expanded(
// //                           child: Text(
// //                             widget.title,
// //                             style: TextStyle(
// //                               fontSize: screenWidth * 0.05,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ),
// //                         ElevatedButton(
// //                           onPressed: () => _startStopTask(context),
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor:
// //                                 isTaskStarted ? Colors.red : Colors.purple,
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(8),
// //                             ),
// //                           ),
// //                           child: Text(
// //                             isTaskStarted ? 'Stop Task' : 'Start Task',
// //                             style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: screenWidth * 0.04),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     SizedBox(height: screenWidth * 0.02),
// //                     Text(
// //                       widget.description,
// //                       style: TextStyle(fontSize: screenWidth * 0.04),
// //                     ),
// //                     SizedBox(height: screenWidth * 0.05),
// //                     if (isTaskStarted)
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           const Divider(
// //                             color: Colors.purple,
// //                             thickness: 2,
// //                             height: 20,
// //                           ),
// //                           // SizedBox(height: screenWidth * 0.02),
// //                           // Row(
// //                           //   children: [
// //                           //     SizedBox(width: screenWidth * 0.02),
// //                           //     Text(
// //                           //       "Started at: ",
// //                           //       style: TextStyle(
// //                           //           color: Colors.black,
// //                           //           fontWeight: FontWeight.bold,
// //                           //           fontSize: screenWidth * 0.045),
// //                           //     ),
// //                           //     Text(
// //                           //       taskStartTime,
// //                           //       style: TextStyle(
// //                           //           color: Colors.purple,
// //                           //           fontSize: screenWidth * 0.045),
// //                           //     )
// //                           //   ],
// //                           // ),


// //                           SizedBox(height: screenWidth * 0.02),
// //                           Row(
// //                             children: [
// //                               SizedBox(width: screenWidth * 0.02),
// //                               Text(
// //                                 "Active task : ",
// //                                 style: TextStyle(
// //                                     color: Colors.black,
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: screenWidth * 0.045),
// //                               ),
// //                               Text(
// //                                 widget.title,
// //                                 style: TextStyle(
// //                                     color: Colors.purple,
// //                                     fontSize: screenWidth * 0.045),
// //                               )
// //                             ],
// //                           ),
// //                           SizedBox(height: screenWidth * 0.02),
// //                           Column(
// //                             mainAxisAlignment: MainAxisAlignment.start,
// //                             crossAxisAlignment: CrossAxisAlignment.center,
// //                             children: [
// //                               Center(
// //                                 child: RichText(
// //                                     text: TextSpan(
// //                                         text: "Started at ",
// //                                         style: TextStyle(
// //                                             fontSize: screenWidth * 0.04,
// //                                             color: Colors.black),
// //                                         children: [
// //                                       TextSpan(
// //                                           text: " $taskStartTime",
// //                                           style: TextStyle(
// //                                               fontWeight: FontWeight.bold,
// //                                               fontSize: screenWidth * 0.04,
// //                                               color: Colors.black))
// //                                     ])),
// //                               )
// //                             ],
// //                           ),
// //                           // SizedBox(height: screenWidth * 0.02),
// //                           // Center(
// //                           //   child: const Icon(Icons.timer, size: 20),
// //                           // ),
// //                           // Center(
// //                           //   child: Text(
// //                           //     " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// //                           //     style: TextStyle(
// //                           //         fontWeight: FontWeight.bold,
// //                           //         fontSize: screenWidth * 0.045),
// //                           //   ),
// //                           // ),


// //                            SizedBox(height: 20),
// //             // Circular progress indicator with elapsed time
// //             Center(
// //               child: Stack(
// //                 alignment: Alignment.center,
// //                 children: [
// //                   // Circular progress
// //                   SizedBox(
// //                     width: 150,
// //                     height: 150,
// //                     child: CircularProgressIndicator(
// //                       value: _elapsedTime.inSeconds / 3600, // Progress percentage (assuming 1 hour task)
// //                       strokeWidth: 8,
// //                       backgroundColor: Colors.grey.shade300,
// //                       valueColor: AlwaysStoppedAnimation<Color>(
// //                         Colors.purple, // Progress color
// //                       ),
// //                     ),
// //                   ),
// //                   // Center content inside the circle
// //                   Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       // Elapsed time in "hr min" format
// //                       Text(
// //                         '${_elapsedTime.inHours} hr ${_elapsedTime.inMinutes % 60} min',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black,
// //                         ),
// //                       ),
// //                       SizedBox(height: 5),
// //                       // Clock icon
// //                       Icon(
// //                         Icons.access_time,
// //                         size: 24,
// //                         color: Colors.grey,
// //                       ),
// //                       SizedBox(height: 5),
// //                       // Elapsed time in "hh:mm:ss" format
// //                       Text(
// //                         _formatElapsedTime(_elapsedTime),
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //                           SizedBox(height: screenWidth * 0.05),
// //                           Text(
// //                             'Status',
// //                             style: TextStyle(
// //                                 fontSize: screenWidth * 0.05,
// //                                 fontWeight: FontWeight.bold),
// //                           ),
// //                           SizedBox(height: screenWidth * 0.03),
// //                           DropdownButtonFormField<String>(
// //                             value: taskStatus,
// //                             items: [
// //                               'To Do',
// //                               'In Progress',
// //                               'Under Review',
// //                               'On Going',
// //                               'Completed'
// //                             ]
// //                                 .map((status) => DropdownMenuItem(
// //                                       value: status,
// //                                       child: Text(status,
// //                                           style: TextStyle(
// //                                               fontSize: screenWidth * 0.04)),
// //                                     ))
// //                                 .toList(),
                                
// //                             onChanged: (value) async  {
// //                               setState(() {
// //                                 taskStatus = value!;
                                
                                
// //                               });
// //                             },
// //                             decoration: InputDecoration(
// //                               border: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(8),
// //                               ),
// //                             ),
// //                           ),

// //                         ]
// //                       ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }














// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // Use for creation
// import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart'; // Use for update
// import 'package:time_sheet_app/features/show_tasks/providers/time_provider.dart';
// import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
// import 'package:time_sheet_app/features/show_tasks/providers/timesheet_update_provider.dart';
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
//   final DateTime startTime = DateTime.now();
//   String taskStartTime = '';
//   Timer? _timer;
//   Duration _elapsedTime = Duration.zero;

//   // Location variables
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

//   /// Fetch user location
//   Future<void> _getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) return;

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) return;
//     }
//     if (permission == LocationPermission.deniedForever) return;

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

//   /// Handles Task Start/Stop and API Calls
//   Future<void> _startStopTask(BuildContext context) async {
//     final timesheetCreateNotifier = ref.read(timesheetCreationProvider.notifier);
//     final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier); // Declared before use

//     if (!isTaskStarted) {
//       // **Start Task**
//       await _getLocation();

//       setState(() {
//         isTaskStarted = true;
//         showSuccessSnackbar(message: "Task Started", context: context);
//         taskStartTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
//         _elapsedTime = Duration.zero;
//       });

//       // **Use TimeSheetModel for Creation**
//       final timesheetData = TimeSheetModel(
//         taskAssignmentId: int.parse(widget.taskId),
//         startTimestamp: startTime,
//         endTimestamp: DateTime.now(),
//         startLocation: currentLocation,
//         endLocation: currentLocation,
//         description: 'Task started',
//         status: 'ONGOING',
//         state: state,
//         city: city,
//         street: street,
//         country: country,
//         postalCode: postalCode,
//         currentLongitude: currentLongitude,
//         currentLatitude: currentLatitude,
//       );

//       await timesheetCreateNotifier.postTimesheet(
//         context: context,
//         timesheetData: timesheetData, // **Fix: Use TimeSheetModel for creation**
//       );

//       _startTimer();
//     } else {
//       // **Stop Task**
//       setState(() {
//         isTaskStarted = false;
//         showSuccessSnackbar(
//             message: "Timesheet updated successfully", context: context);
//       });

//       _stopTimer();

//       // **Use TimeSheetUpdateModel for Updates**
//       final timesheetUpdateData = TimeSheetUpdateModel(
//         id: int.parse(widget.taskId),
//         startLocation: currentLocation,
//         endLocation: currentLocation,
//         description: 'Task Completed',
//         status: 'COMPLETED',
//         startTimestamp: startTime,
//         endTimestamp: DateTime.now(),
//         hoursWorked: _elapsedTime.inHours.toString(),
//         employee: 1,
//         project: 3,
//         task: 9,
//       );

//       await timesheetUpdateNotifier.updateTimesheet(
//         context: context,
//         timesheetId: int.parse(widget.taskId),
//         timesheetData: timesheetUpdateData, // **Fix: Use TimeSheetUpdateModel for updates**
//       );
//     }
//   }

//   /// Start timer for elapsed time tracking
//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _elapsedTime += const Duration(seconds: 1);
//       });
//     });
//   }

//   /// Stop timer
//   void _stopTimer() {
//     _timer?.cancel();
//     _timer = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: Text(widget.title, style: const TextStyle(color: Colors.white)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Text("Task ID: ${widget.taskId}"),
//             ElevatedButton(
//               onPressed: () => _startStopTask(context),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: isTaskStarted ? Colors.red : Colors.purple,
//               ),
//               child: Text(isTaskStarted ? 'Stop Task' : 'Start Task'),
//             ),
//             const SizedBox(height: 20),

//             /// **Dropdown for Task Status Update**
//             DropdownButtonFormField<String>(
//               value: taskStatus,
//               items: ['To Do', 'In Progress', 'Under Review', 'On Going', 'Completed']
//                   .map((status) => DropdownMenuItem(value: status, child: Text(status)))
//                   .toList(),
//               onChanged: (value) async {
//                 setState(() {
//                   taskStatus = value!;
//                 });

//                 // **Update Timesheet on Status Change**
//                 final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
//                 await timesheetUpdateNotifier.updateTimesheet(
//                   context: context,
//                   timesheetId: int.parse(widget.taskId),
//                   timesheetData: TimeSheetUpdateModel(
//                     id: int.parse(widget.taskId),
//                     startLocation: currentLocation,
//                     endLocation: currentLocation,
//                     description: 'Status changed to $taskStatus',
//                     status: taskStatus,
//                     startTimestamp: startTime,
//                     endTimestamp: DateTime.now(),
//                     hoursWorked: _elapsedTime.inHours.toString(),
//                     employee: 1,
//                     project: 3,
//                     task: 9,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
 // Use for creation
 // Use for update
import 'package:time_sheet_app/features/show_tasks/models/timesheet_updation_model.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheetid_provider.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheet_updation_provider.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';

import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

class ShowTaskPage extends ConsumerStatefulWidget {
  final String taskId;
  final String title;
  final String description;

  const ShowTaskPage({
    Key? key,
    required this.taskId,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  ConsumerState<ShowTaskPage> createState() => _ShowTaskPageState();
}

class _ShowTaskPageState extends ConsumerState<ShowTaskPage> {

  bool isTaskStarted = false;
  DateTime startTime = DateTime.now();
  String taskStartTime = '';
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;

  // Location variables
  String currentLocation = '';
  double currentLatitude = 0.0;
  double currentLongitude = 0.0;
  String state = '';
  String city = '';
  String street = '';
  String country = '';
  String postalCode = '';

  String taskStatus = 'To Do';

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  /// Fetch user location
  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks.first;

    setState(() {
      currentLatitude = position.latitude;
      currentLongitude = position.longitude;
      street = place.street ?? "Unknown Street";
      city = place.locality ?? "Unknown City";
      state = place.administrativeArea ?? "Unknown State";
      country = place.country ?? "Unknown Country";
      postalCode = place.postalCode ?? "000000";
      currentLocation = "$street, $city, $state, $country";
    });

    print("📍 Current Location: $currentLocation");
  }

  /// Handles Task Start/Stop and API Calls
  Future<void> _startStopTask(BuildContext context) async {
    final timesheetCreateNotifier = ref.read(timesheetCreationProvider.notifier);
    final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
      final int? timesheetId = ref.watch(timesheetIdProvider);

    if (!isTaskStarted) {
      // **Start Task**
      await _getLocation();

      setState(() {
        isTaskStarted = true;
        showSuccessSnackbar(message: "Task Started", context: context);
        taskStartTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        _elapsedTime = Duration.zero;
      });

      // **Create a new timesheet entry**
      final timesheetData = TimeSheetModel(
        taskAssignmentId: int.parse(widget.taskId),
        startTimestamp: startTime,
        endTimestamp: DateTime.now(),
        startLocation: currentLocation,
        endLocation: currentLocation,
        description: 'Task started',
        status: 'ONGOING',
        state: state,
        city: city,
        street: street,
        country: country,
        postalCode: postalCode,
        currentLongitude: currentLongitude,
        currentLatitude: currentLatitude,
      );

      print("📝 Creating Timesheet: ${timesheetData.toJson()}");
      await timesheetCreateNotifier.postTimesheet(
        context: context,
        timesheetData: timesheetData,
      );

      _startTimer();
    } else {
      // **Stop Task**
      setState(() {
        isTaskStarted = false;
        showSuccessSnackbar(message: "Stopping Task & Updating Timesheet", context: context);
      });

      _stopTimer();

      // **Update timesheet entry**
      final timesheetUpdateData = TimeSheetUpdateModel(
        // id: int.parse(widget.taskId),
        // id: 402,
        id: timesheetId ?? 0, // Provide a default value or handle null case
        startLocation: currentLocation,
        endLocation: currentLocation,
        description: 'Task Completed',
        status: 'COMPLETED',
        startTimestamp: startTime,
        endTimestamp: DateTime.now(),
        hoursWorked: _elapsedTime.inHours.toString(),
        employee: 1,
        project: 3,
        task: 9,
      );

print(timesheetUpdateData.id);
      print("🛠️ Updating Timesheet: ${timesheetUpdateData.toJson()}");
      final updatedTimesheet = await timesheetUpdateNotifier.updateTimesheet(
        context: context,
        // timesheetId: timesheetUpdateData.id,
        timesheetId: timesheetId ?? 0,
        timesheetData: timesheetUpdateData,
      );

      if (updatedTimesheet == null) {
        print("❌ Timesheet update failed!");
        showErrorSnackbar(message: "Failed to update timesheet", context: context);
      } else {
        print("✅ Timesheet successfully updated!");
      }
    }
  }

  /// Start timer for elapsed time tracking
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime += const Duration(seconds: 1);
      });
    });
  }

  /// Stop timer
  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    final int? timesheetId = ref.watch(timesheetIdProvider); 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Task ID: ${widget.taskId}"),
            ElevatedButton(
              onPressed: () => _startStopTask(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: isTaskStarted ? Colors.red : Colors.purple,
              ),
              child: Text(isTaskStarted ? 'Stop Task' : 'Start Task'),
            ),
            const SizedBox(height: 20),

            /// **Dropdown for Task Status Update**
            DropdownButtonFormField<String>(
              value: taskStatus,
              items: ['To Do', 'In Progress', 'Under Review', 'On Going', 'Completed']
                  .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                  .toList(),
              onChanged: (value) async {
                setState(() {
                  taskStatus = value!;
                });

                // **Update Timesheet on Status Change**
                final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
                await timesheetUpdateNotifier.updateTimesheet(
                  context: context,
                  timesheetId: int.parse(widget.taskId),
                  timesheetData: TimeSheetUpdateModel(
                    id: int.parse(widget.taskId),
                    startLocation: currentLocation,
                    endLocation: currentLocation,
                    description: 'Status changed to $taskStatus',
                    status: taskStatus,
                    startTimestamp: startTime,
                    endTimestamp: DateTime.now(),
                    hoursWorked: _elapsedTime.inHours.toString(),
                    employee: 1,
                    project: 3,
                    task: 9,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
