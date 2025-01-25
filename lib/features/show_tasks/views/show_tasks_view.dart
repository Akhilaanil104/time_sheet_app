// // // // import 'package:flutter/material.dart';
// // // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // // import 'package:geolocator/geolocator.dart';
// // // // import 'package:geocoding/geocoding.dart';
// // // // import 'package:intl/intl.dart';
// // // // import 'dart:async';
// // // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // // // import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
// // // // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // // // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart';
// // // // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
// // // // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_status_provider.dart';
// // // // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_update_provider.dart';
// // // // import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';
// // // // import 'package:time_sheet_app/utils/const/helpers/snackbars/warning_snackbar.dart';

// // // // class ShowTaskPage extends ConsumerStatefulWidget {
// // // //   final String taskId;
// // // //   final String title;
// // // //   final String description;

// // // //   const ShowTaskPage({
// // // //     Key? key,
// // // //     required this.taskId,
// // // //     required this.title,
// // // //     required this.description,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   ConsumerState<ShowTaskPage> createState() => _ShowTaskPageState();
// // // // }

// // // // class _ShowTaskPageState extends ConsumerState<ShowTaskPage> {
// // // //   bool isTaskStarted = false;
// // // //   late String a;
// // // //   final startTime = DateTime.now();
// // // //   String taskStartTime = '';
// // // //   String currentLocation = '';
// // // //   String startingLocation = '';
// // // //   String locationName = '';
// // // //   Position? _currentPosition;
// // // //   late GoogleMapController mapController;
// // // //   Set<Marker> _markers = {};
// // // //   Timer? _timer;
// // // //   Duration _elapsedTime = Duration.zero;
// // // //   final TextEditingController _commentController = TextEditingController();
// // // //   String comment = '';
// // // //   String taskStatus = 'To Do';

// // // //   @override
// // // //   void dispose() {
// // // //     _stopTimer();
// // // //     _commentController.clear();
// // // //     super.dispose();
// // // //   }

// // // //   // Add Save Task Logic
// // // //   void _saveTask() {
// // // //     // Logic to save the task (e.g., send to backend, store in database, etc.)
// // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // //       const SnackBar(content: Text("Task saved successfully!")),
// // // //     );
// // // //   }

// // // //   Future<void> _startStopTask(BuildContext context) async {
// // // //     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
// // // //     final timesheetCreateProvider =
// // // //         ref.read(timesheetCreationProvider.notifier);

// // // //     final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
// // // //     final projectId = ref.read(selectedProjectIdProvider.notifier).state;
// // // //     final userId = await sharedPrefServices.getEmployeeId();
// // // //     if (!isTaskStarted) {
// // // //       // Start Task Logic
// // // //       setState(() {
// // // //         isTaskStarted = true;
// // // //         showSuccessSnackbar(
// // // //               message: "Task Started", context: context);
// // // //         taskStartTime =
// // // //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // // //         _elapsedTime = Duration.zero; // Reset the timer
// // // //       });

// // // //       // Fetch location when starting the task

// // // //       await _getCurrentLocation();
// // // //       Future.delayed(const Duration(seconds: 10), () {
// // // //         startingLocation = locationName;
// // // //         a = startingLocation;
// // // //         print(a);
// // // //       });

// // // //       final projectId = ref.read(selectedProjectIdProvider.notifier).state;
// // // //       final userId = await sharedPrefServices.getEmployeeId();
// // // //       print(startingLocation);
// // // // Future.delayed(const Duration(seconds: 10), ()  async{
// // // //       if (taskStartTime.isNotEmpty && _currentPosition != null) {
// // // //         final timesheetData = TimeSheetModel(
// // // //           projectId: projectId!,
// // // //           employeeId: userId!,
// // // //           taskId: int.parse(widget.taskId),
// // // //           startTimestamp: startTime,
// // // //           endTimestamp: DateTime.now(),
// // // //           startLocation: startingLocation,
// // // //           endLocation: locationName,
// // // //           description: 'Task is started',
// // // //         );


// // // //  print(startingLocation);
// // // //         // Post timesheet data to start task
// // // //         await timesheetCreateProvider.postTimesheet(
// // // //           context: context,
// // // //           timesheetData: timesheetData,
// // // //         );
// // // //       }
// // // //     });
// // // //       _startTimer();
// // // //     } else {
// // // //       // Stop Task Logic
// // // //       setState(() {
// // // //         // if (comment.isNotEmpty) {
// // // //           isTaskStarted = false;
// // // //           showSuccessSnackbar(
// // // //               message: "Timesheet updated successfully", context: context);

// // // //           // taskStartTime = '';
// // // //           // currentLocation = '';
// // // //           // locationName = '';
// // // //           // _markers.clear();
// // // //         // } else {
// // // //         //   isTaskStarted = true;
// // // //         //   showWarningSnackbar(
// // // //         //       message: "Descprtion can't be empty", context: context);
// // // //         // }
// // // //       });

// // // //       // Fetch the required task ID dynamically if needed
// // // //       final taskId = int.parse(widget.taskId);
// // // //       final endTimestamp = DateTime.now();
// // // //       //  DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // // //       a = startingLocation;
// // // //       await _getCurrentLocation();

// // // //       if (taskId != null) {
// // // //         final timesheetUpdateData = TimesheetUpdateModel(
// // // //           id: taskId,
// // // //           startTimestamp: startTime,
// // // //           endTimestamp: endTimestamp,
// // // //           startLocation: a,
// // // //           endLocation: locationName,
// // // //           description: _commentController.text,
// // // //           project: projectId!,
// // // //           employee: userId!,
// // // //           hoursWorked: 2.0,
// // // //           status: taskStatus,
// // // //           task: int.parse(widget.taskId),
// // // //         );
     
// // // //             ref.read(selectedTimesheetStatusProvider.notifier).state = taskStatus;

// // // //         // Call updateTimesheet method from the provider
// // // //         await timesheetUpdateNotifier.updateTimesheet(
// // // //           context: context,
// // // //           timesheetData: timesheetUpdateData,
// // // //         );
// // // //       }
// // // //       _commentController.clear();
// // // //       _stopTimer();
// // // //     }
// // // //   }
// // // //   // Future<void> _startStopTask(BuildContext context) async {
// // // //   //   if (!isTaskStarted) {
// // // //   //     setState(() {
// // // //   //       isTaskStarted = true;
// // // //   //       taskStartTime =
// // // //   //           DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // // //   //       _elapsedTime = Duration.zero; // Reset the timer
// // // //   //     });

// // // //   //     // Fetch location when starting the task
// // // //   //     await _getCurrentLocation();
// // // //   //     final projectId = ref.read(selectedProjectIdProvider.notifier).state;
// // // //   //     // 1,
// // // //   //     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
// // // //   //     final userId = await sharedPrefServices.getEmployeeId();

// // // //   //     // Prepare data for the first start
// // // //   //     if (taskStartTime.isNotEmpty && _currentPosition != null) {
// // // //   //       final timesheetData = TimeSheetModel(
// // // //   //         projectId: projectId!,
// // // //   //         // Replace with actual project ID
// // // //   //         employeeId: userId!, // Replace with actual employee ID
// // // //   //         taskId: int.parse(widget.taskId), // Convert task ID
// // // //   //         startTimestamp: startTime,

// // // //   //         endTimestamp: DateTime.now(),
// // // //   //         startLocation: currentLocation,
// // // //   //         endLocation: currentLocation,
// // // //   //         description: 'Task is started',
// // // //   //       );

// // // //   //       // Call provider to post timesheet data
// // // //   //       await ref.read(timesheetCreationProvider.notifier).postTimesheet(
// // // //   //             context: context,
// // // //   //             timesheetData: timesheetData,
// // // //   //           );
// // // //   //     }

// // // //   //     _startTimer();
// // // //   //   } else {
// // // //   //     setState(() {
// // // //   //       isTaskStarted = false;
// // // //   //       taskStartTime = '';
// // // //   //       currentLocation = '';
// // // //   //       locationName = '';
// // // //   //       _markers.clear();
// // // //   //     });

// // // //   //     _stopTimer();
// // // //   //   }
// // // //   // }

// // // //   // Method to request location permissions and fetch current location
// // // //   Future<void> _getCurrentLocation() async {
// // // //     bool serviceEnabled;
// // // //     LocationPermission permission;

// // // //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// // // //     if (!serviceEnabled) {
// // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // //         const SnackBar(content: Text("Please enable location services.")),
// // // //       );
// // // //       return;
// // // //     }

// // // //     permission = await Geolocator.checkPermission();
// // // //     if (permission == LocationPermission.denied) {
// // // //       permission = await Geolocator.requestPermission();
// // // //       if (permission == LocationPermission.denied) {
// // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // //           const SnackBar(content: Text("Location permission denied.")),
// // // //         );
// // // //         return;
// // // //       }
// // // //     }

// // // //     if (permission == LocationPermission.deniedForever) {
// // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // //         const SnackBar(
// // // //             content: Text("Location permission permanently denied.")),
// // // //       );
// // // //       return;
// // // //     }

// // // //     Position position = await Geolocator.getCurrentPosition(
// // // //         desiredAccuracy: LocationAccuracy.high);

// // // //     setState(() {
// // // //       _currentPosition = position;
// // // //       currentLocation = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
// // // //     });

// // // //     // Reverse geocode to get location name
// // // //     _getAddressFromLatLng(position.latitude, position.longitude);

// // // //     // Add marker and update map
// // // //     _markers.add(
// // // //       Marker(
// // // //         markerId: const MarkerId('currentLocation'),
// // // //         position: LatLng(position.latitude, position.longitude),
// // // //         infoWindow: const InfoWindow(title: 'Current Location'),
// // // //       ),
// // // //     );
// // // //     mapController.animateCamera(
// // // //       CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
// // // //     );
// // // //   }

// // // //   // Method to get address from latitude and longitude
// // // //   Future<void> _getAddressFromLatLng(double lat, double lng) async {
// // // //     try {
// // // //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// // // //       Placemark place = placemarks.first;

// // // //       setState(() {
// // // //         // Extract and format the location name
// // // //         locationName = "${place.locality}, ${place.administrativeArea}";
// // // //       });
// // // //     } catch (e) {
// // // //       setState(() {
// // // //         locationName = "Unable to fetch location name";
// // // //       });
// // // //     }
// // // //   }

// // // //   // Start/Stop Task
// // // //   // void _startStopTask() {
// // // //   //   if (!isTaskStarted) {
// // // //   //     setState(() {
// // // //   //       isTaskStarted = true;
// // // //   //       taskStartTime =
// // // //   //           DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // // //   //       _elapsedTime = Duration.zero; // Reset the timer
// // // //   //     });

// // // //   //     // Start the timer
// // // //   //     _startTimer();
// // // //   //     // Fetch location when starting the task
// // // //   //     _getCurrentLocation();
// // // //   //   } else {
// // // //   //     setState(() {
// // // //   //       isTaskStarted = false;
// // // //   //       taskStartTime = '';
// // // //   //       currentLocation = '';
// // // //   //       locationName = '';
// // // //   //       _markers.clear(); // Clear the markers on stop
// // // //   //     });

// // // //   //     // Stop the timer
// // // //   //     _stopTimer();
// // // //   //   }
// // // //   // }

// // // //   // Timer methods
// // // //   void _startTimer() {
// // // //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// // // //       setState(() {
// // // //         _elapsedTime += const Duration(seconds: 1);
// // // //       });
// // // //     });
// // // //   }

// // // //   void _stopTimer() {
// // // //     _timer?.cancel();
// // // //     _timer = null;
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final screenWidth = MediaQuery.of(context).size.width;
// // // //     final screenHeight = MediaQuery.of(context).size.height;

// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.purple,
// // // //         title: Text(
// // // //           widget.title,
// // // //           style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
// // // //         ),
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: EdgeInsets.all(screenWidth * 0.04),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             // Task Details Card
// // // //             Card(
// // // //               shape: RoundedRectangleBorder(
// // // //                 borderRadius: BorderRadius.circular(12),
// // // //               ),
// // // //               elevation: 3,
// // // //               child: Padding(
// // // //                 padding: EdgeInsets.all(screenWidth * 0.04),
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Text(
// // // //                       "Task ID: ${widget.taskId}",
// // // //                       style: TextStyle(
// // // //                         fontSize: screenWidth * 0.04,
// // // //                       ),
// // // //                     ),
// // // //                     SizedBox(height: screenWidth * 0.02),
// // // //                     Row(
// // // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                       children: [
// // // //                         Expanded(
// // // //                           child: Text(
// // // //                             // overflow:  TextOverflow.ellipsis
// // // //                             // ,
// // // //                             // maxLines: 1,
// // // //                             widget.title,
// // // //                             style: TextStyle(
// // // //                               fontSize: screenWidth * 0.05,
// // // //                               fontWeight: FontWeight.bold,
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                         ElevatedButton(
// // // //                           onPressed: () => _startStopTask(context),
// // // //                           style: ElevatedButton.styleFrom(
// // // //                             backgroundColor:
// // // //                                 isTaskStarted ? Colors.red : Colors.purple,
// // // //                             shape: RoundedRectangleBorder(
// // // //                               borderRadius: BorderRadius.circular(8),
// // // //                             ),
// // // //                           ),
// // // //                           child: Text(
// // // //                             isTaskStarted ? 'Stop Task' : 'Start Task',
// // // //                             style: TextStyle(
// // // //                                 color: Colors.white,
// // // //                                 fontSize: screenWidth * 0.04),
// // // //                           ),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                     SizedBox(height: screenWidth * 0.02),
// // // //                     Text(
// // // //                       widget.description,
// // // //                       style: TextStyle(fontSize: screenWidth * 0.04),
// // // //                     ),
// // // //                     SizedBox(height: screenWidth * 0.05),
// // // //                     if (isTaskStarted)
// // // //                       Column(
// // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // //                         children: [
// // // //                           const Divider(
// // // //                             color: Colors.purple,
// // // //                             thickness: 2,
// // // //                             height: 20,
// // // //                           ),
// // // //                           SizedBox(height: screenWidth * 0.02),
// // // //                           Row(
// // // //                             children: [
// // // //                               SizedBox(width: screenWidth * 0.02),
// // // //                               Text(
// // // //                                 "Active task : ",
// // // //                                 style: TextStyle(
// // // //                                     color: Colors.black,
// // // //                                     fontWeight: FontWeight.bold,
// // // //                                     fontSize: screenWidth * 0.045),
// // // //                               ),
// // // //                               Text(
// // // //                                 widget.title,
// // // //                                 style: TextStyle(
// // // //                                     color: Colors.purple,
// // // //                                     fontSize: screenWidth * 0.045),
// // // //                               )
// // // //                             ],
// // // //                           ),
// // // //                           SizedBox(height: screenWidth * 0.02),
// // // //                           Column(
// // // //                             mainAxisAlignment: MainAxisAlignment.start,
// // // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // // //                             children: [
// // // //                               Center(
// // // //                                 child: RichText(
// // // //                                     text: TextSpan(
// // // //                                         text: "Started at ",
// // // //                                         style: TextStyle(
// // // //                                             fontSize: screenWidth * 0.04,
// // // //                                             color: Colors.black),
// // // //                                         children: [
// // // //                                       TextSpan(
// // // //                                           text: " $taskStartTime",
// // // //                                           style: TextStyle(
// // // //                                               fontWeight: FontWeight.bold,
// // // //                                               fontSize: screenWidth * 0.04,
// // // //                                               color: Colors.black))
// // // //                                     ])),
// // // //                               )
// // // //                             ],
// // // //                           ),
// // // //                           SizedBox(height: screenWidth * 0.02),
// // // //                           Center(
// // // //                             child: const Icon(Icons.timer, size: 20),
// // // //                           ),
// // // //                           Center(
// // // //                             child: Text(
// // // //                               " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// // // //                               style: TextStyle(
// // // //                                   fontWeight: FontWeight.bold,
// // // //                                   fontSize: screenWidth * 0.045),
// // // //                             ),
// // // //                           ),
// // // //                           Row(
// // // //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                             children: [
// // // //                               RichText(
// // // //                                 text: TextSpan(
// // // //                                     text: "Gps tracking:",
// // // //                                     style: TextStyle(
// // // //                                         color: Colors.black,
// // // //                                         fontSize: screenWidth * 0.05,
// // // //                                         fontWeight: FontWeight.w400),
// // // //                                     children: [
// // // //                                       TextSpan(
// // // //                                           text: "Active",
// // // //                                           style: TextStyle(
// // // //                                               color: Colors.green,
// // // //                                               fontSize: screenWidth * 0.05,
// // // //                                               fontWeight: FontWeight.bold))
// // // //                                     ]),
// // // //                               ),
// // // //                               Row(
// // // //                                 children: [
// // // //                                   const Icon(Icons.location_pin,
// // // //                                       size: 20, color: Colors.red),
// // // //                                   Text(
// // // //                                     locationName.isNotEmpty
// // // //                                         ? locationName
// // // //                                         : 'Fetching ...',
// // // //                                     style:
// // // //                                         TextStyle(fontSize: screenWidth * 0.04),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                           Container(
// // // //                             margin: EdgeInsets.symmetric(
// // // //                                 vertical: screenWidth * 0.02),
// // // //                             height: screenHeight * 0.3,
// // // //                             color: Colors.black12,
// // // //                             child: GoogleMap(
// // // //                               onMapCreated: (GoogleMapController controller) {
// // // //                                 mapController = controller;
// // // //                               },
// // // //                               initialCameraPosition: CameraPosition(
// // // //                                 target: _currentPosition != null
// // // //                                     ? LatLng(
// // // //                                         _currentPosition!.latitude,
// // // //                                         _currentPosition!.longitude,
// // // //                                       )
// // // //                                     : const LatLng(0.0, 0.0),
// // // //                                 zoom: 15,
// // // //                               ),
// // // //                               markers: _markers,
// // // //                               myLocationEnabled: true,
// // // //                               zoomControlsEnabled: false,
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     SizedBox(height: screenWidth * 0.05),
// // // //                     isTaskStarted
// // // //                         ? Column(
// // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // //                             children: [
// // // //                               Text(
// // // //                                 'Status',
// // // //                                 style: TextStyle(
// // // //                                     fontSize: screenWidth * 0.05,
// // // //                                     fontWeight: FontWeight.bold),
// // // //                               ),
// // // //                               SizedBox(height: screenWidth * 0.03),
// // // //                               DropdownButtonFormField<String>(
// // // //                                 value: taskStatus,
// // // //                                 items: [
// // // //                                   'To Do',
// // // //                                   'In Progress',
// // // //                                   'Under Review',
// // // //                                   'On Going',
// // // //                                   'Completed'
// // // //                                 ]
// // // //                                     .map((status) => DropdownMenuItem(
// // // //                                           value: status,
// // // //                                           child: Text(status,
// // // //                                               style: TextStyle(
// // // //                                                   fontSize:
// // // //                                                       screenWidth * 0.04)),
// // // //                                         ))
// // // //                                     .toList(),
// // // //                                 onChanged: (value) {
// // // //                                   setState(() {
// // // //                                     taskStatus = value!;
// // // //                                   });
// // // //                                 },
// // // //                                 decoration: InputDecoration(
// // // //                                   border: OutlineInputBorder(
// // // //                                     borderRadius: BorderRadius.circular(8),
// // // //                                   ),
// // // //                                 ),
// // // //                               ),
// // // //                               SizedBox(height: screenWidth * 0.05),
// // // //                               // Text(
// // // //                               //   'Add Comments',
// // // //                               //   style: TextStyle(
// // // //                               //       fontSize: screenWidth * 0.05,
// // // //                               //       fontWeight: FontWeight.bold),
// // // //                               // ),
// // // //                               RichText(
// // // //                             text: TextSpan(
// // // //                               text: 'Add Comments ',
// // // //                               style: TextStyle(
// // // //                                 fontSize: screenWidth * 0.05,
// // // //                                 fontWeight: FontWeight.bold,
// // // //                                 color: Colors.black,
// // // //                               ),
// // // //                               children: [
// // // //                                 TextSpan(
// // // //                                   text: '(Optional)',
// // // //                                   style: TextStyle(
// // // //                                     fontSize: screenWidth * 0.045,
// // // //                                     fontWeight: FontWeight.normal,
// // // //                                     color: Colors.grey,
// // // //                                   ),
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                               ),
// // // //                               SizedBox(height: screenWidth * 0.03),
// // // //                               Row(
// // // //                                 children: [
// // // //                                   Expanded(
// // // //                                     child: TextField(
// // // //                                       controller: _commentController,
// // // //                                       maxLines: 2,
// // // //                                       decoration: InputDecoration(
// // // //                                         hintText: 'Enter your comments here',
// // // //                                         border: OutlineInputBorder(
// // // //                                           borderRadius:
// // // //                                               BorderRadius.circular(8),
// // // //                                         ),
// // // //                                       ),
// // // //                                       onChanged: (value) {
// // // //                                          comment = value;
// // // //                                         // setState(() {
                                         
// // // //                                         // });
// // // //                                       },
// // // //                                     ),
// // // //                                   ),
// // // //                                   // if (comment.trim().isNotEmpty)
// // // //                                   //   IconButton(
// // // //                                   //     icon: const Icon(Icons.send),
// // // //                                   //     onPressed: () {
// // // //                                   //       ScaffoldMessenger.of(context).showSnackBar(
// // // //                                   //         SnackBar(content: Text('Comment submitted: $comment')),
// // // //                                   //       );
// // // //                                   //       _commentController.clear();
// // // //                                   //       setState(() {
// // // //                                   //         comment = '';
// // // //                                   //       });
// // // //                                   //     },
// // // //                                   //   ),
// // // //                                 ],
// // // //                               ),
// // // //                             ],
// // // //                           )
// // // //                         : SizedBox(),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             // SizedBox(height: screenWidth * 0.05),
// // // //             // Text(
// // // //             //   'Status',
// // // //             //   style: TextStyle(
// // // //             //       fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
// // // //             // ),
// // // //             // SizedBox(height: screenWidth * 0.03),
// // // //             // DropdownButtonFormField<String>(
// // // //             //   value: taskStatus,
// // // //             //   items: ['To Do', 'In Progress', 'Completed']
// // // //             //       .map((status) => DropdownMenuItem(
// // // //             //             value: status,
// // // //             //             child: Text(status,
// // // //             //                 style: TextStyle(fontSize: screenWidth * 0.04)),
// // // //             //           ))
// // // //             //       .toList(),
// // // //             //   onChanged: (value) {
// // // //             //     setState(() {
// // // //             //       taskStatus = value!;
// // // //             //     });
// // // //             //   },
// // // //             //   decoration: InputDecoration(
// // // //             //     border: OutlineInputBorder(
// // // //             //       borderRadius: BorderRadius.circular(8),
// // // //             //     ),
// // // //             //   ),
// // // //             // ),
// // // //             // SizedBox(height: screenWidth * 0.05),
// // // //             // Text(
// // // //             //   'Add Comments',
// // // //             //   style: TextStyle(
// // // //             //       fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
// // // //             // ),
// // // //             // SizedBox(height: screenWidth * 0.03),
// // // //             // Row(
// // // //             //   children: [
// // // //             //     Expanded(
// // // //             //       child: TextField(
// // // //             //         controller: _commentController,
// // // //             //         maxLines: 2,
// // // //             //         decoration: InputDecoration(
// // // //             //           hintText: 'Enter your comments here',
// // // //             //           border: OutlineInputBorder(
// // // //             //             borderRadius: BorderRadius.circular(8),
// // // //             //           ),
// // // //             //         ),
// // // //             //         onChanged: (value) {
// // // //             //           setState(() {
// // // //             //             comment = value;
// // // //             //           });
// // // //             //         },
// // // //             //       ),
// // // //             //     ),
// // // //             //     // if (comment.trim().isNotEmpty)
// // // //             //     //   IconButton(
// // // //             //     //     icon: const Icon(Icons.send),
// // // //             //     //     onPressed: () {
// // // //             //     //       ScaffoldMessenger.of(context).showSnackBar(
// // // //             //     //         SnackBar(content: Text('Comment submitted: $comment')),
// // // //             //     //       );
// // // //             //     //       _commentController.clear();
// // // //             //     //       setState(() {
// // // //             //     //         comment = '';
// // // //             //     //       });
// // // //             //     //     },
// // // //             //     //   ),
// // // //             //   ],
// // // //             // ),
// // // //             SizedBox(height: screenWidth * 0.10),
// // // //             // Center(
// // // //             //   child: ElevatedButton(
// // // //             // onPressed: _saveTask,
// // // //             // style: ElevatedButton.styleFrom(
// // // //             //   backgroundColor: Colors.purple,
// // // //             //   padding: EdgeInsets.symmetric(
// // // //             //       vertical: screenWidth * 0.02,
// // // //             //       horizontal: screenWidth * 0.04),
// // // //             //   minimumSize: Size(screenWidth * 0.3, screenHeight * 0.05),
// // // //             //   shape: RoundedRectangleBorder(
// // // //             //     borderRadius: BorderRadius.circular(8),
// // // //             //   ),
// // // //             // ),
// // // //             //     style: ElevatedButton.styleFrom(
// // // //             //       minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
// // // //             //       backgroundColor: Colors.purple,
// // // //             //       shape: RoundedRectangleBorder(
// // // //             //         borderRadius: BorderRadius.circular(20),
// // // //             //       ),
// // // //             //     ),
// // // //             //     child: Text(
// // // //             //       "Save Task",
// // // //             //       style: TextStyle(
// // // //             //           fontSize: screenWidth * 0.04, color: Colors.white),
// // // //             //     ),
// // // //             //   ),
// // // //             // ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }




// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'dart:async';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // import 'package:geolocator/geolocator.dart';
// // // import 'package:geocoding/geocoding.dart';
// // // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // // import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
// // // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart';
// // // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
// // // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_status_provider.dart';
// // // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_update_provider.dart';
// // // import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// // // class ShowTaskPage extends ConsumerStatefulWidget {
// // //   final String taskId;
// // //   final String title;
// // //   final String description;

// // //   const ShowTaskPage({
// // //     Key? key,
// // //     required this.taskId,
// // //     required this.title,
// // //     required this.description,
// // //   }) : super(key: key);

// // //   @override
// // //   ConsumerState<ShowTaskPage> createState() => _ShowTaskPageState();
// // // }

// // // class _ShowTaskPageState extends ConsumerState<ShowTaskPage> {
// // //   bool isTaskStarted = false;
// // //   final startTime = DateTime.now();
// // //   String taskStartTime = '';
// // //   Timer? _timer;
// // //   Duration _elapsedTime = Duration.zero;
// // //   final TextEditingController _commentController = TextEditingController();
// // //   String comment = '';
// // //   String taskStatus = 'To Do';
// // //   String currentLocation = '';

// // //   @override
// // //   void dispose() {
// // //     _stopTimer();
// // //     _commentController.clear();
// // //     super.dispose();
// // //   }

// // //   Future<void> _getCurrentLocation() async {
// // //     bool serviceEnabled;
// // //     LocationPermission permission;

// // //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// // //     if (!serviceEnabled) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("Please enable location services.")),
// // //       );
// // //       return;
// // //     }

// // //     permission = await Geolocator.checkPermission();
// // //     if (permission == LocationPermission.denied) {
// // //       permission = await Geolocator.requestPermission();
// // //       if (permission == LocationPermission.denied) {
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           const SnackBar(content: Text("Location permission denied.")),
// // //         );
// // //         return;
// // //       }
// // //     }

// // //     if (permission == LocationPermission.deniedForever) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(
// // //             content: Text("Location permission permanently denied.")),
// // //       );
// // //       return;
// // //     }

// // //     Position position = await Geolocator.getCurrentPosition(
// // //         desiredAccuracy: LocationAccuracy.high);

// // //     List<Placemark> placemarks = await placemarkFromCoordinates(
// // //         position.latitude, position.longitude);
// // //     Placemark place = placemarks.first;

// // //     setState(() {
// // //       // currentLocation = "${place.locality}, ${place.administrativeArea}";
// // //       currentLocation = "${place.street}, ${place.subLocality},${place.locality}";
// // //     });
// // //   }

// // //   Future<void> _startStopTask(BuildContext context) async {
// // //     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
// // //     final timesheetCreateProvider =
// // //         ref.read(timesheetCreationProvider.notifier);
// // //     final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
// // //     final projectId = ref.read(selectedProjectIdProvider.notifier).state;
// // //     final userId = await sharedPrefServices.getEmployeeId();

// // //     if (!isTaskStarted) {
// // //       await _getCurrentLocation();

// // //       setState(() {
// // //         isTaskStarted = true;
// // //         showSuccessSnackbar(message: "Task Started", context: context);
// // //         taskStartTime =
// // //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // //         _elapsedTime = Duration.zero; // Reset the timer
// // //       });

// // //       if (taskStartTime.isNotEmpty) {
// // //         final timesheetData = TimeSheetModel(
// // //           projectId: projectId!,
// // //           employeeId: userId!,
// // //           taskId: int.parse(widget.taskId),
// // //           startTimestamp: startTime,
// // //           endTimestamp: DateTime.now(),
// // //           startLocation: currentLocation,
// // //           endLocation: currentLocation,
// // //           description: 'Task is started',
// // //         );

// // //         await timesheetCreateProvider.postTimesheet(
// // //           context: context,
// // //           timesheetData: timesheetData,
// // //         );
// // //       }
// // //       _startTimer();
// // //     } else {
// // //       setState(() {
// // //         isTaskStarted = false;
// // //         showSuccessSnackbar(
// // //             message: "Timesheet updated successfully", context: context);
// // //       });

// // //       final taskId = int.parse(widget.taskId);
// // //       final endTimestamp = DateTime.now();

// // //       if (taskId != null) {
// // //         final timesheetUpdateData = TimesheetUpdateModel(
// // //           id: taskId,
// // //           startTimestamp: startTime,
// // //           endTimestamp: endTimestamp,
// // //           startLocation: currentLocation,
// // //           endLocation: currentLocation,
// // //           description: _commentController.text,
// // //           project: projectId!,
// // //           employee: userId!,
// // //           hoursWorked: 2.0,
// // //           status: taskStatus,
// // //           task: int.parse(widget.taskId),
// // //         );

// // //         ref.read(selectedTimesheetStatusProvider.notifier).state = taskStatus;

// // //         await timesheetUpdateNotifier.updateTimesheet(
// // //           context: context,
// // //           timesheetData: timesheetUpdateData,
// // //         );
// // //       }
// // //       _commentController.clear();
// // //       _stopTimer();
// // //     }
// // //   }

// // //   void _startTimer() {
// // //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// // //       setState(() {
// // //         _elapsedTime += const Duration(seconds: 1);
// // //       });
// // //     });
// // //   }

// // //   void _stopTimer() {
// // //     _timer?.cancel();
// // //     _timer = null;
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final screenWidth = MediaQuery.of(context).size.width;
// // //     final screenHeight = MediaQuery.of(context).size.height;

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.purple,
// // //         title: Text(
// // //           widget.title,
// // //           style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: EdgeInsets.all(screenWidth * 0.04),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Card(
// // //               shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(12),
// // //               ),
// // //               elevation: 3,
// // //               child: Padding(
// // //                 padding: EdgeInsets.all(screenWidth * 0.04),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       "Task ID: ${widget.taskId}",
// // //                       style: TextStyle(
// // //                         fontSize: screenWidth * 0.04,
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: screenWidth * 0.02),
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                       children: [
// // //                         Expanded(
// // //                           child: Text(
// // //                             widget.title,
// // //                             style: TextStyle(
// // //                               fontSize: screenWidth * 0.05,
// // //                               fontWeight: FontWeight.bold,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         ElevatedButton(
// // //                           onPressed: () => _startStopTask(context),
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor:
// // //                                 isTaskStarted ? Colors.red : Colors.purple,
// // //                             shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(8),
// // //                             ),
// // //                           ),
// // //                           child: Text(
// // //                             isTaskStarted ? 'Stop Task' : 'Start Task',
// // //                             style: TextStyle(
// // //                                 color: Colors.white,
// // //                                 fontSize: screenWidth * 0.04),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     SizedBox(height: screenWidth * 0.02),
// // //                     Text(
// // //                       widget.description,
// // //                       style: TextStyle(fontSize: screenWidth * 0.04),
// // //                     ),
// // //                     SizedBox(height: screenWidth * 0.05),
// // //                     if (isTaskStarted)
// // //                       Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           const Divider(
// // //                             color: Colors.purple,
// // //                             thickness: 2,
// // //                             height: 20,
// // //                           ),
// // //                           SizedBox(height: screenWidth * 0.02),
// // //                           Row(
// // //                             children: [
// // //                               SizedBox(width: screenWidth * 0.02),
// // //                               Text(
// // //                                 "Active task : ",
// // //                                 style: TextStyle(
// // //                                     color: Colors.black,
// // //                                     fontWeight: FontWeight.bold,
// // //                                     fontSize: screenWidth * 0.045),
// // //                               ),
// // //                               Text(
// // //                                 widget.title,
// // //                                 style: TextStyle(
// // //                                     color: Colors.purple,
// // //                                     fontSize: screenWidth * 0.045),
// // //                               )
// // //                             ],
// // //                           ),
// // //                           SizedBox(height: screenWidth * 0.02),
// // //                           Column(
// // //                             mainAxisAlignment: MainAxisAlignment.start,
// // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                             children: [
// // //                               Center(
// // //                                 child: RichText(
// // //                                     text: TextSpan(
// // //                                         text: "Started at ",
// // //                                         style: TextStyle(
// // //                                             fontSize: screenWidth * 0.04,
// // //                                             color: Colors.black),
// // //                                         children: [
// // //                                       TextSpan(
// // //                                           text: " $taskStartTime",
// // //                                           style: TextStyle(
// // //                                               fontWeight: FontWeight.bold,
// // //                                               fontSize: screenWidth * 0.04,
// // //                                               color: Colors.black))
// // //                                     ])),
// // //                               )
// // //                             ],
// // //                           ),
// // //                           SizedBox(height: screenWidth * 0.02),
// // //                           Center(
// // //                             child: const Icon(Icons.timer, size: 20),
// // //                           ),
// // //                           Center(
// // //                             child: Text(
// // //                               " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// // //                               style: TextStyle(
// // //                                   fontWeight: FontWeight.bold,
// // //                                   fontSize: screenWidth * 0.045),
// // //                             ),
// // //                           ),
// // //                           SizedBox(height: screenWidth * 0.05),
// // //                           Text(
// // //                             'Status',
// // //                             style: TextStyle(
// // //                                 fontSize: screenWidth * 0.05,
// // //                                 fontWeight: FontWeight.bold),
// // //                           ),
// // //                           SizedBox(height: screenWidth * 0.03),
// // //                           DropdownButtonFormField<String>(
// // //                             value: taskStatus,
// // //                             items: [
// // //                               'To Do',
// // //                               'In Progress',
// // //                               'Under Review',
// // //                               'On Going',
// // //                               'Completed'
// // //                             ]
// // //                                 .map((status) => DropdownMenuItem(
// // //                                       value: status,
// // //                                       child: Text(status,
// // //                                           style: TextStyle(
// // //                                               fontSize:
// // //                                                   screenWidth * 0.04)),
// // //                                     ))
// // //                                 .toList(),
// // //                             onChanged: (value) {
// // //                                 ref.read(selectedTimesheetStatusProvider.notifier).state = value!; 
// // //                               setState(() {
// // //                                 taskStatus = value!;
// // //                               });
// // //                             },
// // //                             decoration: InputDecoration(
// // //                               border: OutlineInputBorder(
// // //                                 borderRadius: BorderRadius.circular(8),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                           SizedBox(height: screenWidth * 0.05),
// // //                           RichText(
// // //                             text: TextSpan(
// // //                               text: 'Add Comments ',
// // //                               style: TextStyle(
// // //                                 fontSize: screenWidth * 0.05,
// // //                                 fontWeight: FontWeight.bold,
// // //                                 color: Colors.black,
// // //                               ),
// // //                               children: [
// // //                                 TextSpan(
// // //                                   text: '(Optional)',
// // //                                   style: TextStyle(
// // //                                     fontSize: screenWidth * 0.045,
// // //                                     fontWeight: FontWeight.normal,
// // //                                     color: Colors.grey,
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                           SizedBox(height: screenWidth * 0.03),
// // //                           Row(
// // //                             children: [
// // //                               Expanded(
// // //                                 child: TextField(
// // //                                   controller: _commentController,
// // //                                   maxLines: 2,
// // //                                   decoration: InputDecoration(
// // //                                     hintText: 'Enter your comments here',
// // //                                     border: OutlineInputBorder(
// // //                                       borderRadius:
// // //                                           BorderRadius.circular(8),
// // //                                     ),
// // //                                   ),
// // //                                   onChanged: (value) {
// // //                                     comment = value;
// // //                                   },
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ],
// // //                       ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }





// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'dart:async';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
// // import 'package:time_sheet_app/features/home/views/home_view.dart';
// // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart';
// // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
// // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_status_provider.dart';
// // import 'package:time_sheet_app/features/show_tasks/providers/timesheet_update_provider.dart';
// // import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// // // class LocationService {
// // //   static Future<String> requestLocationPermission(BuildContext context) async {
// // //     bool serviceEnabled;
// // //     LocationPermission permission;

// // //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// // //     if (!serviceEnabled) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(content: Text("Please enable location services.")),
// // //       );
// // //       return "";
// // //     }

// // //     permission = await Geolocator.checkPermission();
// // //     if (permission == LocationPermission.denied) {
// // //       permission = await Geolocator.requestPermission();
// // //       if (permission == LocationPermission.denied) {
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           const SnackBar(content: Text("Location permission denied.")),
// // //         );
// // //         return "";
// // //       }
// // //     }

// // //     if (permission == LocationPermission.deniedForever) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(
// // //             content: Text("Location permission permanently denied.")),
// // //       );
// // //       return "";
// // //     }

// // //     Position position = await Geolocator.getCurrentPosition(
// // //         desiredAccuracy: LocationAccuracy.high);

// // //     List<Placemark> placemarks = await placemarkFromCoordinates(
// // //         position.latitude, position.longitude);
// // //     Placemark place = placemarks.first;

// // //     return "${place.street}, ${place.subLocality}, ${place.locality}";
// // //   }
// // // }

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
// //   final TextEditingController _commentController = TextEditingController();
// //   String comment = '';
// //   String taskStatus = 'To Do';
// //   String currentLocation = '';

// //   @override
// //   void dispose() {
// //     _stopTimer();
// //     _commentController.clear();
// //     super.dispose();
// //   }

// //   Future<void> _startStopTask(BuildContext context) async {
// //     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
// //     final timesheetCreateProvider =
// //         ref.read(timesheetCreationProvider.notifier);
// //     final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
// //     final projectId = ref.read(selectedProjectIdProvider.notifier).state;
// //     final userId = await sharedPrefServices.getEmployeeId();

// //     if (!isTaskStarted) {
// //       currentLocation = await LocationService.requestLocationPermission(context);
// //       if (currentLocation.isEmpty) return;

// //       setState(() {
// //         isTaskStarted = true;
// //         showSuccessSnackbar(message: "Task Started", context: context);
// //         taskStartTime =
// //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// //         _elapsedTime = Duration.zero; // Reset the timer
// //       });

// //       if (taskStartTime.isNotEmpty) {
// //         final timesheetData = TimeSheetModel(
// //           projectId: projectId!,
// //           employeeId: userId!,
// //           taskId: int.parse(widget.taskId),
// //           startTimestamp: startTime,
// //           endTimestamp: DateTime.now(),
// //           startLocation: currentLocation,
// //           endLocation: currentLocation,
// //           description: 'Task is started',
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

// //       final taskId = int.parse(widget.taskId);
// //       final endTimestamp = DateTime.now();

// //       if (taskId != null) {
// //         final timesheetUpdateData = TimesheetUpdateModel(
// //           id: taskId,
// //           startTimestamp: startTime,
// //           endTimestamp: endTimestamp,
// //           startLocation: currentLocation,
// //           endLocation: currentLocation,
// //           description: _commentController.text,
// //           project: projectId!,
// //           employee: userId!,
// //           hoursWorked: 2.0,
// //           status: taskStatus,
// //           task: int.parse(widget.taskId),
// //         );

// //         ref.read(selectedTimesheetStatusProvider.notifier).state = taskStatus;

// //         await timesheetUpdateNotifier.updateTimesheet(
// //           context: context,
// //           timesheetData: timesheetUpdateData,
// //         );
// //       }
// //       _commentController.clear();
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

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final screenHeight = MediaQuery.of(context).size.height;

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
// //                           SizedBox(height: screenWidth * 0.02),
// //                           Center(
// //                             child: const Icon(Icons.timer, size: 20),
// //                           ),
// //                           Center(
// //                             child: Text(
// //                               " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// //                               style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: screenWidth * 0.045),
// //                             ),
// //                           ),
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
// //                                               fontSize:
// //                                                   screenWidth * 0.04)),
// //                                     ))
// //                                 .toList(),
// //                             onChanged: (value) {
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
// //                           SizedBox(height: screenWidth * 0.05),
// //                           RichText(
// //                             text: TextSpan(
// //                               text: 'Add Comments ',
// //                               style: TextStyle(
// //                                 fontSize: screenWidth * 0.05,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.black,
// //                               ),
// //                               children: [
// //                                 TextSpan(
// //                                   text: '(Optional)',
// //                                   style: TextStyle(
// //                                     fontSize: screenWidth * 0.045,
// //                                     fontWeight: FontWeight.normal,
// //                                     color: Colors.grey,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           SizedBox(height: screenWidth * 0.03),
// //                           Row(
// //                             children: [
// //                               Expanded(
// //                                 child: TextField(
// //                                   controller: _commentController,
// //                                   maxLines: 2,
// //                                   decoration: InputDecoration(
// //                                     hintText: 'Enter your comments here',
// //                                     border: OutlineInputBorder(
// //                                       borderRadius:
// //                                           BorderRadius.circular(8),
// //                                     ),
// //                                   ),
// //                                   onChanged: (value) {
// //                                     comment = value;
// //                                   },
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
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
// import 'package:time_sheet_app/common/shared_pref_provider.dart';
// import 'package:time_sheet_app/features/comment/provider/comment_creation_provider.dart';


// import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
// import 'package:time_sheet_app/features/home/views/home_view.dart';

// import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart';

// import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
// import 'package:time_sheet_app/features/show_tasks/providers/timesheet_status_provider.dart';
// import 'package:time_sheet_app/features/show_tasks/providers/timesheet_update_provider.dart';
// import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// // class LocationService {
// //   static Future<String> requestLocationPermission(BuildContext context) async {
// //     bool serviceEnabled;
// //     LocationPermission permission;

// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Please enable location services.")),
// //       );
// //       return "";
// //     }

// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text("Location permission denied.")),
// //         );
// //         return "";
// //       }
// //     }

// //     if (permission == LocationPermission.deniedForever) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //             content: Text("Location permission permanently denied.")),
// //       );
// //       return "";
// //     }

// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);

// //     List<Placemark> placemarks = await placemarkFromCoordinates(
// //         position.latitude, position.longitude);
// //     Placemark place = placemarks.first;

// //     return "${place.street}, ${place.subLocality}, ${place.locality}";
// //   }
// // }

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
//   final TextEditingController _commentController = TextEditingController();
//   String comment = '';
//   String taskStatus = 'To Do';
//   String currentLocation = '';

//   @override
//   void dispose() {
//     _stopTimer();
//     _commentController.clear();
//     super.dispose();
//   }
// Future<void> _submitComment(BuildContext context) async {
//     final commentProvider = ref.read(commentCreationProvider.notifier);

//     // Create a CommentModel instance with the user's input
//     final commentData = CommentModel(
//       comment: comment,
//       parentComment: null, // Update as needed if parent comments are used
//     );

//     // Call the createComment method in the provider
//     await commentProvider.createComment(
//       context: context,
//       commentData: commentData,
//       taskId: int.parse(widget.taskId), // Pass the task ID
//     );

//     // Clear the comment box after successful submission
//     setState(() {
//       _commentController.clear();
//       comment = '';
//     });
//   }
//   Future<void> _startStopTask(BuildContext context) async {
//     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
//     final timesheetCreateProvider =
//         ref.read(timesheetCreationProvider.notifier);
//     final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
//     final projectId = ref.read(selectedProjectIdProvider.notifier).state;
//     final userId = await sharedPrefServices.getEmployeeId();

//     if (!isTaskStarted) {
//       currentLocation =
//           await LocationService.requestLocationPermission(context);
//       if (currentLocation.isEmpty) return;

//       setState(() {
//         isTaskStarted = true;
//         showSuccessSnackbar(message: "Task Started", context: context);
//         taskStartTime =
//             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
//         _elapsedTime = Duration.zero; // Reset the timer
//       });

//       if (taskStartTime.isNotEmpty) {
//         final timesheetData = TimeSheetModel(
//           projectId: projectId!,
//           employeeId: userId!,
//           taskId: int.parse(widget.taskId),
//           startTimestamp: startTime,
//           endTimestamp: DateTime.now(),
//           startLocation: currentLocation,
//           endLocation: currentLocation,
//           description: 'Task is started',
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

//       final taskId = int.parse(widget.taskId);
//       final endTimestamp = DateTime.now();

//       if (taskId != null) {
//         final timesheetUpdateData = TimesheetUpdateModel(
//           id: taskId,
//           startTimestamp: startTime,
//           endTimestamp: endTimestamp,
//           startLocation: currentLocation,
//           endLocation: currentLocation,
//           description: _commentController.text,
//           project: projectId!,
//           employee: userId!,
//           hoursWorked: 2.0,
//           status: taskStatus,
//           task: int.parse(widget.taskId),
//         );

//         ref.read(selectedTimesheetStatusProvider.notifier).state = taskStatus;

//         await timesheetUpdateNotifier.updateTimesheet(
//           context: context,
//           timesheetData: timesheetUpdateData,
//         );
//       }
//       _commentController.clear();
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

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

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
//                           SizedBox(height: screenWidth * 0.02),
//                           Center(
//                             child: const Icon(Icons.timer, size: 20),
//                           ),
//                           Center(
//                             child: Text(
//                               " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: screenWidth * 0.045),
//                             ),
//                           ),
//                           SizedBox(height: screenWidth * 0.05),
//                           Text(
//                             'Status',
//                             style: TextStyle(
//                                 fontSize: screenWidth * 0.05,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: screenWidth * 0.03),
//                           // DropdownButtonFormField<String>(
//                           //   value: taskStatus,
//                           //   items: [
//                           //     'To Do',
//                           //     'In Progress',
//                           //     'Under Review',
//                           //     'On Going',
//                           //     'Completed'
//                           //   ]
//                           //       .map((status) => DropdownMenuItem(
//                           //             value: status,
//                           //             child: Text(status,
//                           //                 style: TextStyle(
//                           //                     fontSize: screenWidth * 0.04)),
//                           //           ))
//                           //       .toList(),
                                
//                           //   onChanged: (value) async  {
//                           //     setState(() {
//                           //       taskStatus = value!;
                                
                                
//                           //     });
//                           //   },
//                           //   decoration: InputDecoration(
//                           //     border: OutlineInputBorder(
//                           //       borderRadius: BorderRadius.circular(8),
//                           //     ),
//                           //   ),
//                           // ),

//                          DropdownButtonFormField<String>(
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
//                             onChanged: (value) async {
//                               if (value != null) {
//                                 setState(() {
//                                   taskStatus = value; // Update the status
//                                 });

//                                 // Call update timesheet logic
//                                 final sharedPrefServices =
//                                     ref.read(sharedPrefServicesProvider);
//                                 final timesheetUpdateNotifier =
//                                     ref.read(timesheetUpdateProvider.notifier);
//                                 final projectId = ref
//                                     .read(selectedProjectIdProvider.notifier)
//                                     .state;
//                                 final userId =
//                                     await sharedPrefServices.getEmployeeId();

//                                 final timesheetUpdateData =
//                                     TimesheetUpdateModel(
//                                   id: int.parse(widget.taskId),
//                                   startTimestamp: startTime,
//                                   endTimestamp: DateTime.now(),
//                                   startLocation: currentLocation,
//                                   endLocation: currentLocation,
//                                   description: _commentController.text,
//                                   project: projectId!,
//                                   employee: userId!,
//                                   hoursWorked: _elapsedTime.inHours.toDouble() +
//                                       (_elapsedTime.inMinutes % 60 / 60.0),
//                                   status: taskStatus, // Use the updated status
//                                   task: int.parse(widget.taskId),
//                                 );

//                                 await timesheetUpdateNotifier.updateTimesheet(
//                                   context: context,
//                                   timesheetData: timesheetUpdateData,
//                                 );

//                                 showSuccessSnackbar(
//                                   message: "Task status updated to $taskStatus",
//                                   context: context,
//                                 );
//                               }
//                             },
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),

                       
//                           SizedBox(height: screenWidth * 0.05),
//                           // RichText(
//                           //   text: TextSpan(
//                           //     text: 'Add Comments ',
//                           //     style: TextStyle(
//                           //       fontSize: screenWidth * 0.05,
//                           //       fontWeight: FontWeight.bold,
//                           //       color: Colors.black,
//                           //     ),
//                           //     children: [
//                           //       TextSpan(
//                           //         text: '(Optional)',
//                           //         style: TextStyle(
//                           //           fontSize: screenWidth * 0.045,
//                           //           fontWeight: FontWeight.normal,
//                           //           color: Colors.grey,
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // SizedBox(height: screenWidth * 0.03),
//                           // Row(
//                           //   children: [
//                           //     Expanded(
//                           //       child: TextField(
//                           //         controller: _commentController,
//                           //         maxLines: 2,
//                           //         decoration: InputDecoration(
//                           //           hintText: 'Enter your comments here',
//                           //           border: OutlineInputBorder(
//                           //             borderRadius: BorderRadius.circular(8),
//                           //           ),
//                           //         ),
//                           //         onChanged: (value) {
//                           //           comment = value;
//                           //         },
//                           //       ),
//                           //     ),
//                           //   ],
//                           // ),

//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                   text: 'Add Comments ',
//                                   style: TextStyle(
//                                     fontSize: screenWidth * 0.05,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                   children: [
//                                     TextSpan(
//                                       text: '(Optional)',
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.045,
//                                         fontWeight: FontWeight.normal,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: screenWidth * 0.03),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: TextField(
//                                       controller: _commentController,
//                                       maxLines: 2,
//                                       decoration: InputDecoration(
//                                         hintText: 'Enter your comments here',
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                       onChanged: (value) {
//                                         setState(() {
//                                           comment = value.trim();
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   if (comment
//                                       .isNotEmpty) // Show the button only if the comment is not empty
//                                     IconButton(
//                                       icon: const Icon(Icons.send,
//                                           color: Colors.purple),
//                                       onPressed: () async {
//                                         print("posting add comment");
//                                         await _submitComment(context);

//                                       },
//                                     ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
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






import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
import 'package:time_sheet_app/features/home/views/home_view.dart';
import 'package:time_sheet_app/features/show_tasks/models/comment_model.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart';
import 'package:time_sheet_app/features/show_tasks/providers/comment_creation_provider.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheet_creation_provider.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheet_status_provider.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheet_update_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// class LocationService {
//   static Future<String> requestLocationPermission(BuildContext context) async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enable location services.")),
//       );
//       return "";
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Location permission denied.")),
//         );
//         return "";
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text("Location permission permanently denied.")),
//       );
//       return "";
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude, position.longitude);
//     Placemark place = placemarks.first;

//     return "${place.street}, ${place.subLocality}, ${place.locality}";
//   }
// }

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
  final startTime = DateTime.now();
  String taskStartTime = '';
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  final TextEditingController _commentController = TextEditingController();
  String comment = '';
  String taskStatus = 'To Do';
  String currentLocation = '';

  @override
  void dispose() {
    _stopTimer();
    _commentController.clear();
    super.dispose();
  }
Future<void> _submitComment(BuildContext context) async {
    final commentProvider = ref.read(commentCreationProvider.notifier);

    // Create a CommentModel instance with the user's input
    final commentData = CommentModel(
      comment: comment,
      parentComment: null, // Update as needed if parent comments are used
    );

    // Call the createComment method in the provider
    await commentProvider.createComment(
      context: context,
      commentData: commentData,
      taskId: int.parse(widget.taskId), // Pass the task ID
    );

    // Clear the comment box after successful submission
    setState(() {
      _commentController.clear();
      comment = '';
    });
  }
  Future<void> _startStopTask(BuildContext context) async {
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final timesheetCreateProvider =
        ref.read(timesheetCreationProvider.notifier);
    final timesheetUpdateNotifier = ref.read(timesheetUpdateProvider.notifier);
    final projectId = ref.read(selectedProjectIdProvider.notifier).state;
    final userId = await sharedPrefServices.getEmployeeId();

    if (!isTaskStarted) {
      currentLocation =
          await LocationService.requestLocationPermission(context);
      if (currentLocation.isEmpty) return;

      setState(() {
        isTaskStarted = true;
        showSuccessSnackbar(message: "Task Started", context: context);
        taskStartTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        _elapsedTime = Duration.zero; // Reset the timer
      });

      if (taskStartTime.isNotEmpty) {
        final timesheetData = TimeSheetModel(
          projectId: projectId!,
          employeeId: userId!,
          taskId: int.parse(widget.taskId),
          startTimestamp: startTime,
          endTimestamp: DateTime.now(),
          startLocation: currentLocation,
          endLocation: currentLocation,
          description: 'Task is started',
        );

        await timesheetCreateProvider.postTimesheet(
          context: context,
          timesheetData: timesheetData,
        );
      }
      _startTimer();
    } else {
      setState(() {
        isTaskStarted = false;
        showSuccessSnackbar(
            message: "Timesheet updated successfully", context: context);
      });

      final taskId = int.parse(widget.taskId);
      final endTimestamp = DateTime.now();

      if (taskId != null) {
        final timesheetUpdateData = TimesheetUpdateModel(
          id: taskId,
          startTimestamp: startTime,
          endTimestamp: endTimestamp,
          startLocation: currentLocation,
          endLocation: currentLocation,
          description: _commentController.text,
          project: projectId!,
          employee: userId!,
          hoursWorked: 2.0,
          status: taskStatus,
          task: int.parse(widget.taskId),
        );

        ref.read(selectedTimesheetStatusProvider.notifier).state = taskStatus;

        await timesheetUpdateNotifier.updateTimesheet(
          context: context,
          timesheetData: timesheetUpdateData,
        );
      }
      _commentController.clear();
      _stopTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime += const Duration(seconds: 1);
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task ID: ${widget.taskId}",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _startStopTask(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isTaskStarted ? Colors.red : Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            isTaskStarted ? 'Stop Task' : 'Start Task',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      widget.description,
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: screenWidth * 0.05),
                    if (isTaskStarted)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            color: Colors.purple,
                            thickness: 2,
                            height: 20,
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Row(
                            children: [
                              SizedBox(width: screenWidth * 0.02),
                              Text(
                                "Active task : ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.045),
                              ),
                              Text(
                                widget.title,
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: screenWidth * 0.045),
                              )
                            ],
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: RichText(
                                    text: TextSpan(
                                        text: "Started at ",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            color: Colors.black),
                                        children: [
                                      TextSpan(
                                          text: " $taskStartTime",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth * 0.04,
                                              color: Colors.black))
                                    ])),
                              )
                            ],
                          ),
                          SizedBox(height: screenWidth * 0.02),
                          Center(
                            child: const Icon(Icons.timer, size: 20),
                          ),
                          Center(
                            child: Text(
                              " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.045),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),
                          Text(
                            'Status',
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: screenWidth * 0.03),
                          // DropdownButtonFormField<String>(
                          //   value: taskStatus,
                          //   items: [
                          //     'To Do',
                          //     'In Progress',
                          //     'Under Review',
                          //     'On Going',
                          //     'Completed'
                          //   ]
                          //       .map((status) => DropdownMenuItem(
                          //             value: status,
                          //             child: Text(status,
                          //                 style: TextStyle(
                          //                     fontSize: screenWidth * 0.04)),
                          //           ))
                          //       .toList(),
                                
                          //   onChanged: (value) async  {
                          //     setState(() {
                          //       taskStatus = value!;
                                
                                
                          //     });
                          //   },
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //   ),
                          // ),

                         DropdownButtonFormField<String>(
                            value: taskStatus,
                            items: [
                              'To Do',
                              'In Progress',
                              'Under Review',
                              'On Going',
                              'Completed'
                            ]
                                .map((status) => DropdownMenuItem(
                                      value: status,
                                      child: Text(status,
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.04)),
                                    ))
                                .toList(),
                            onChanged: (value) async {
                              if (value != null) {
                                setState(() {
                                  taskStatus = value; // Update the status
                                });

                                // Call update timesheet logic
                                final sharedPrefServices =
                                    ref.read(sharedPrefServicesProvider);
                                final timesheetUpdateNotifier =
                                    ref.read(timesheetUpdateProvider.notifier);
                                final projectId = ref
                                    .read(selectedProjectIdProvider.notifier)
                                    .state;
                                final userId =
                                    await sharedPrefServices.getEmployeeId();

                                final timesheetUpdateData =
                                    TimesheetUpdateModel(
                                  id: int.parse(widget.taskId),
                                  startTimestamp: startTime,
                                  endTimestamp: DateTime.now(),
                                  startLocation: currentLocation,
                                  endLocation: currentLocation,
                                  description: _commentController.text,
                                  project: projectId!,
                                  employee: userId!,
                                  hoursWorked: _elapsedTime.inHours.toDouble() +
                                      (_elapsedTime.inMinutes % 60 / 60.0),
                                  status: taskStatus, // Use the updated status
                                  task: int.parse(widget.taskId),
                                );

                                await timesheetUpdateNotifier.updateTimesheet(
                                  context: context,
                                  timesheetData: timesheetUpdateData,
                                );

                                showSuccessSnackbar(
                                  message: "Task status updated to $taskStatus",
                                  context: context,
                                );
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                       
                          SizedBox(height: screenWidth * 0.05),
                          // RichText(
                          //   text: TextSpan(
                          //     text: 'Add Comments ',
                          //     style: TextStyle(
                          //       fontSize: screenWidth * 0.05,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.black,
                          //     ),
                          //     children: [
                          //       TextSpan(
                          //         text: '(Optional)',
                          //         style: TextStyle(
                          //           fontSize: screenWidth * 0.045,
                          //           fontWeight: FontWeight.normal,
                          //           color: Colors.grey,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: screenWidth * 0.03),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: TextField(
                          //         controller: _commentController,
                          //         maxLines: 2,
                          //         decoration: InputDecoration(
                          //           hintText: 'Enter your comments here',
                          //           border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(8),
                          //           ),
                          //         ),
                          //         onChanged: (value) {
                          //           comment = value;
                          //         },
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Add Comments ',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '(Optional)',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.045,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenWidth * 0.03),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _commentController,
                                      maxLines: 2,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your comments here',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          comment = value.trim();
                                        });
                                      },
                                    ),
                                  ),
                                  if (comment
                                      .isNotEmpty) // Show the button only if the comment is not empty
                                    IconButton(
                                      icon: const Icon(Icons.send,
                                          color: Colors.purple),
                                      onPressed: () async {
                                        print("posting add comment");
                                        await _submitComment(context);

                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
