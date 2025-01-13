// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // // // // import 'package:geolocator/geolocator.dart';
// // // // // // import 'package:geocoding/geocoding.dart';
// // // // // // import 'package:intl/intl.dart';
// // // // // // import 'dart:async';

// // // // // // class ShowTaskPage extends StatefulWidget {
// // // // // //   final String taskId;
// // // // // //   final String title;
// // // // // //   final String description;

// // // // // //   const ShowTaskPage({
// // // // // //     Key? key,
// // // // // //     required this.taskId,
// // // // // //     required this.title,
// // // // // //     required this.description,
// // // // // //   }) : super(key: key);

// // // // // //   @override
// // // // // //   State<ShowTaskPage> createState() => _ShowTaskPageState();
// // // // // // }

// // // // // // class _ShowTaskPageState extends State<ShowTaskPage> {
// // // // // //   bool isTaskStarted = false;
// // // // // //   String taskStartTime = '';
// // // // // //   String taskStatus = 'To Do';
// // // // // //   String comment = '';
// // // // // //   String currentLocation = '';
// // // // // //   String locationName = '';
// // // // // //   Position? _currentPosition;
// // // // // //   late GoogleMapController mapController;
// // // // // //   Set<Marker> _markers = {};

// // // // // //   // Timer-related variables
// // // // // //   Timer? _timer;
// // // // // //   Duration _elapsedTime = Duration.zero;
// // // // // //   final TextEditingController _commentController = TextEditingController();

// // // // // //    // Add Save Task Logic
// // // // // //   void _saveTask() {
// // // // // //     // Logic to save the task (e.g., send to backend, store in database, etc.)
// // // // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // // // //       const SnackBar(content: Text("Task saved successfully!")),
// // // // // //     );
// // // // // //   }

// // // // // //   // Method to request location permissions and fetch current location
// // // // // //   Future<void> _getCurrentLocation() async {
// // // // // //     bool serviceEnabled;
// // // // // //     LocationPermission permission;

// // // // // //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// // // // // //     if (!serviceEnabled) {
// // // // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // // // //         const SnackBar(content: Text("Please enable location services.")),
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     permission = await Geolocator.checkPermission();
// // // // // //     if (permission == LocationPermission.denied) {
// // // // // //       permission = await Geolocator.requestPermission();
// // // // // //       if (permission == LocationPermission.denied) {
// // // // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // // // //           const SnackBar(content: Text("Location permission denied.")),
// // // // // //         );
// // // // // //         return;
// // // // // //       }
// // // // // //     }

// // // // // //     if (permission == LocationPermission.deniedForever) {
// // // // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // // // //         const SnackBar(
// // // // // //             content: Text("Location permission permanently denied.")),
// // // // // //       );
// // // // // //       return;
// // // // // //     }

// // // // // //     Position position = await Geolocator.getCurrentPosition(
// // // // // //         desiredAccuracy: LocationAccuracy.high);

// // // // // //     setState(() {
// // // // // //       _currentPosition = position;
// // // // // //       currentLocation = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
// // // // // //     });

// // // // // //     // Reverse geocode to get location name
// // // // // //     _getAddressFromLatLng(position.latitude, position.longitude);

// // // // // //     // Add marker and update map
// // // // // //     _markers.add(
// // // // // //       Marker(
// // // // // //         markerId: const MarkerId('currentLocation'),
// // // // // //         position: LatLng(position.latitude, position.longitude),
// // // // // //         infoWindow: const InfoWindow(title: 'Current Location'),
// // // // // //       ),
// // // // // //     );
// // // // // //     mapController.animateCamera(
// // // // // //       CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
// // // // // //     );
// // // // // //   }

// // // // // //   // Method to get address from latitude and longitude
// // // // // //   // Future<void> _getAddressFromLatLng(double lat, double lng) async {
// // // // // //   //   try {
// // // // // //   //     List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// // // // // //   //     Placemark place = placemarks.first;

// // // // // //   //     setState(() {
// // // // // //   //       locationName =
// // // // // //   //           "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
// // // // // //   //     });
// // // // // //   //   } catch (e) {
// // // // // //   //     setState(() {
// // // // // //   //       locationName = "Unable to fetch location name";
// // // // // //   //     });
// // // // // //   //   }
// // // // // //   // }

// // // // // //   Future<void> _getAddressFromLatLng(double lat, double lng) async {
// // // // // //     try {
// // // // // //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// // // // // //       Placemark place = placemarks.first;

// // // // // //       setState(() {
// // // // // //         // Extract and format the location name
// // // // // //         locationName = "${place.locality}, ${place.administrativeArea}";
// // // // // //       });
// // // // // //     } catch (e) {
// // // // // //       setState(() {
// // // // // //         locationName = "Unable to fetch location name";
// // // // // //       });
// // // // // //     }
// // // // // //   }

// // // // // //   // Start/Stop Task
// // // // // //   void _startStopTask() {
// // // // // //     if (!isTaskStarted) {
// // // // // //       setState(() {
// // // // // //         isTaskStarted = true;
// // // // // //         taskStartTime =
// // // // // //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // // // // //         _elapsedTime = Duration.zero; // Reset the timer
// // // // // //       });

// // // // // //       // Start the timer
// // // // // //       _startTimer();
// // // // // //       // Fetch location when starting the task
// // // // // //       _getCurrentLocation();
// // // // // //     } else {
// // // // // //       setState(() {
// // // // // //         isTaskStarted = false;
// // // // // //         taskStartTime = '';
// // // // // //         currentLocation = '';
// // // // // //         locationName = '';
// // // // // //         _markers.clear(); // Clear the markers on stop
// // // // // //       });

// // // // // //       // Stop the timer
// // // // // //       _stopTimer();
// // // // // //     }
// // // // // //   }

// // // // // //   // Timer methods
// // // // // //   void _startTimer() {
// // // // // //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// // // // // //       setState(() {
// // // // // //         _elapsedTime += const Duration(seconds: 1);
// // // // // //       });
// // // // // //     });
// // // // // //   }

// // // // // //   void _stopTimer() {
// // // // // //     _timer?.cancel();
// // // // // //     _timer = null;
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _stopTimer();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         backgroundColor: Colors.purple,
// // // // // //         title: Text(
// // // // // //           widget.title,
// // // // // //           style: const TextStyle(color: Colors.white),
// // // // // //         ),
// // // // // //       ),
// // // // // //       body: SingleChildScrollView(
// // // // // //         padding: const EdgeInsets.all(16.0),
// // // // // //         child: Column(
// // // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             // Task Details Card
// // // // // //             Card(
// // // // // //               shape: RoundedRectangleBorder(
// // // // // //                 borderRadius: BorderRadius.circular(12),
// // // // // //               ),
// // // // // //               elevation: 3,
// // // // // //               child: Padding(
// // // // // //                 padding: const EdgeInsets.all(16.0),
// // // // // //                 child: Column(
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                   children: [
// // // // // //                     Text(
// // // // // //                       "Task ID: ${widget.taskId}",
// // // // // //                       style: const TextStyle(fontSize: 16),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 10),
// // // // // //                     Row(
// // // // // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // // //                       children: [
// // // // // //                         Text(
// // // // // //                           widget.title,
// // // // // //                           style: const TextStyle(
// // // // // //                             fontSize: 20,
// // // // // //                             fontWeight: FontWeight.bold,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                         ElevatedButton(
// // // // // //                           onPressed: _startStopTask,
// // // // // //                           style: ElevatedButton.styleFrom(
// // // // // //                             backgroundColor:
// // // // // //                                 isTaskStarted ? Colors.red : Colors.purple,
// // // // // //                             shape: RoundedRectangleBorder(
// // // // // //                               borderRadius: BorderRadius.circular(8),
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                           child: Text(
// // // // // //                             isTaskStarted ? 'Stop Task' : 'Start Task',
// // // // // //                             style: const TextStyle(color: Colors.white),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ],
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 10),
// // // // // //                     Text(
// // // // // //                       widget.description,
// // // // // //                       style: const TextStyle(fontSize: 16),
// // // // // //                     ),
// // // // // //                     const SizedBox(height: 20),
// // // // // //                     // Start/Stop Task Button inside Task Card
// // // // // //                     // ElevatedButton(
// // // // // //                     //   onPressed: _startStopTask,
// // // // // //                     //   style: ElevatedButton.styleFrom(
// // // // // //                     //     backgroundColor:
// // // // // //                     //         isTaskStarted ? Colors.red : Colors.purple,
// // // // // //                     //     shape: RoundedRectangleBorder(
// // // // // //                     //       borderRadius: BorderRadius.circular(8),
// // // // // //                     //     ),
// // // // // //                     //   ),
// // // // // //                     //   child: Text(
// // // // // //                     //     isTaskStarted ? 'Stop Task' : 'Start Task',
// // // // // //                     //     style: const TextStyle(color: Colors.white),
// // // // // //                     //   ),
// // // // // //                     // ),
// // // // // //                     isTaskStarted
// // // // // //                         ? Column(
// // // // // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                             children: [
// // // // // //                               // Divider
// // // // // //                               const Divider(
// // // // // //                                 color: Colors.purple,
// // // // // //                                 thickness: 2,
// // // // // //                                 height: 20,
// // // // // //                               ),
// // // // // //                               SizedBox(
// // // // // //                                 height: 3,
// // // // // //                               ),
// // // // // //                               Row(
// // // // // //                                 children: [
// // // // // //                                   SizedBox(
// // // // // //                                     width: 10,
// // // // // //                                   ),
// // // // // //                                   Text(
// // // // // //                                     "Active task : ",
// // // // // //                                     style: TextStyle(
// // // // // //                                         color: Colors.black,
// // // // // //                                         fontWeight: FontWeight.bold,
// // // // // //                                         fontSize: 17),
// // // // // //                                   ),
// // // // // //                                   Text(
// // // // // //                                     widget.title,
// // // // // //                                     style: TextStyle(
// // // // // //                                         color: Colors.purple, fontSize: 17),
// // // // // //                                   )
// // // // // //                                 ],
// // // // // //                               ),
// // // // // //                               SizedBox(
// // // // // //                                 height: 10,
// // // // // //                               ),
// // // // // //                               // Active Task Section
// // // // // //                               Column(
// // // // // //                                 mainAxisAlignment: MainAxisAlignment.start,
// // // // // //                                 crossAxisAlignment: CrossAxisAlignment.center,
// // // // // //                                 children: [
// // // // // //                                   Center(
// // // // // //                                     child: RichText(
// // // // // //                                         text: TextSpan(
// // // // // //                                             text: "Started at ",
// // // // // //                                             style: TextStyle(
// // // // // //                                                 fontSize: 17,
// // // // // //                                                 color: Colors.black),
// // // // // //                                             children: [
// // // // // //                                           TextSpan(
// // // // // //                                               text: " $taskStartTime",
// // // // // //                                               style: TextStyle(
// // // // // //                                                   fontWeight: FontWeight.bold,
// // // // // //                                                   fontSize: 17,
// // // // // //                                                   color: Colors.black))
// // // // // //                                         ])),
// // // // // //                                   )
// // // // // //                                 ],
// // // // // //                               ),

// // // // // //                               SizedBox(
// // // // // //                                 height: 10,
// // // // // //                               ),
// // // // // //                               // Started Time

// // // // // //                               Center(
// // // // // //                                 child: const Icon(Icons.timer, size: 20),
// // // // // //                               ),

// // // // // //                               Center(
// // // // // //                                 child: Text(
// // // // // //                                   " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// // // // // //                                   style: TextStyle(
// // // // // //                                       fontWeight: FontWeight.bold,
// // // // // //                                       fontSize: 17),
// // // // // //                                 ),
// // // // // //                               ),

// // // // // //                               // Timer

// // // // // //                               // GPS Tracking
// // // // // //                               Row(
// // // // // //                                 mainAxisAlignment:
// // // // // //                                     MainAxisAlignment.spaceBetween,
// // // // // //                                 children: [
// // // // // //                                   RichText(
// // // // // //                                     text: TextSpan(
// // // // // //                                         text: "Gps tracking:",
// // // // // //                                         style: TextStyle(
// // // // // //                                             color: Colors.black,
// // // // // //                                             fontSize: 20,
// // // // // //                                             fontWeight: FontWeight.w400),
// // // // // //                                         children: [
// // // // // //                                           TextSpan(
// // // // // //                                               text: "Active",
// // // // // //                                               style: TextStyle(
// // // // // //                                                   color: Colors.green,
// // // // // //                                                   fontSize: 20,
// // // // // //                                                   fontWeight: FontWeight.bold))
// // // // // //                                         ]),
// // // // // //                                   ),
// // // // // //                                   Row(
// // // // // //                                     children: [
// // // // // //                                       const Icon(Icons.location_pin,
// // // // // //                                           size: 20, color: Colors.red),
// // // // // //                                       Text(
// // // // // //                                         locationName.isNotEmpty
// // // // // //                                             ? locationName
// // // // // //                                             : 'Fetching location...',
// // // // // //                                         style: const TextStyle(fontSize: 20),
// // // // // //                                       ),
// // // // // //                                     ],
// // // // // //                                   ),
// // // // // //                                 ],
// // // // // //                               ),

// // // // // //                               // Map Placeholder (Replace with actual map widget if needed)
// // // // // //                               Container(
// // // // // //                                 margin:
// // // // // //                                     const EdgeInsets.symmetric(vertical: 10),
// // // // // //                                 height: 200,
// // // // // //                                 color: Colors.black12,
// // // // // //                                 child: GoogleMap(
// // // // // //                                   onMapCreated:
// // // // // //                                       (GoogleMapController controller) {
// // // // // //                                     mapController = controller;
// // // // // //                                   },
// // // // // //                                   initialCameraPosition: CameraPosition(
// // // // // //                                     target: _currentPosition != null
// // // // // //                                         ? LatLng(
// // // // // //                                             _currentPosition!.latitude,
// // // // // //                                             _currentPosition!.longitude,
// // // // // //                                           )
// // // // // //                                         : const LatLng(0.0, 0.0),
// // // // // //                                     zoom: 15,
// // // // // //                                   ),
// // // // // //                                   markers: _markers,
// // // // // //                                   myLocationEnabled: true,
// // // // // //                                   zoomControlsEnabled: false,
// // // // // //                                 ),
// // // // // //                               ),
// // // // // //                             ],
// // // // // //                           )
// // // // // //                         : Container()
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),

// // // // // //             const SizedBox(height: 20),

// // // // // //             // Status Section
// // // // // //             const Text(
// // // // // //               'Status',
// // // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // //             ),
// // // // // //             const SizedBox(height: 10),
// // // // // //             DropdownButtonFormField<String>(
// // // // // //               value: taskStatus,
// // // // // //               items: ['To Do', 'In Progress', 'Completed']
// // // // // //                   .map((status) => DropdownMenuItem(
// // // // // //                         value: status,
// // // // // //                         child: Text(status),
// // // // // //                       ))
// // // // // //                   .toList(),
// // // // // //               onChanged: (value) {
// // // // // //                 setState(() {
// // // // // //                   taskStatus = value!;
// // // // // //                 });
// // // // // //               },
// // // // // //               decoration: InputDecoration(
// // // // // //                 border: OutlineInputBorder(
// // // // // //                   borderRadius: BorderRadius.circular(8),
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 20),

// // // // // //             // Add Comments Section
// // // // // //             // const Text(
// // // // // //             //   'Add Comments',
// // // // // //             //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // //             // ),
// // // // // //             // const SizedBox(height: 10),
// // // // // //             // TextField(
// // // // // //             //   maxLines: 3,
// // // // // //             //   decoration: InputDecoration(
// // // // // //             //     hintText: 'Enter your comments here',
// // // // // //             //     border: OutlineInputBorder(
// // // // // //             //       borderRadius: BorderRadius.circular(12),
// // // // // //             //     ),
// // // // // //             //   ),
// // // // // //             //   onChanged: (value) {
// // // // // //             //     setState(() {
// // // // // //             //       comment = value;
// // // // // //             //     });
// // // // // //             //   },
// // // // // //             // ),
// // // // // //             // Add Comments Section
// // // // // //             const SizedBox(height: 20),

// // // // // //             // Add Comments Section
// // // // // //             const Text(
// // // // // //               'Add Comments',
// // // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // //             ),
// // // // // //             const SizedBox(height: 10),
// // // // // //             Row(
// // // // // //               children: [
// // // // // //                 Expanded(
// // // // // //                   child: TextField(
// // // // // //                     controller: _commentController,
// // // // // //                     maxLines: 2,
// // // // // //                     decoration: InputDecoration(
// // // // // //                       hintText: 'Enter your comments here',
// // // // // //                       border: OutlineInputBorder(
// // // // // //                         borderRadius: BorderRadius.circular(8),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     onChanged: (value) {
// // // // // //                       setState(() {
// // // // // //                         comment = value;
// // // // // //                       });
// // // // // //                     },
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 if (comment
// // // // // //                     .trim()
// // // // // //                     .isNotEmpty) // Show the send icon only when there's a comment
// // // // // //                   IconButton(
// // // // // //                     icon: const Icon(Icons.send),
// // // // // //                     onPressed: () {
// // // // // //                       // Handle sending the comment
// // // // // //                       ScaffoldMessenger.of(context).showSnackBar(
// // // // // //                         SnackBar(content: Text('Comment submitted: $comment')),
// // // // // //                       );

// // // // // //                       // Clear the comment field
// // // // // //                       _commentController.clear();
// // // // // //                       setState(() {
// // // // // //                         comment = '';
// // // // // //                       });
// // // // // //                     },
// // // // // //                   ),
                 
// // // // // //               ],
// // // // // //             ),
// // // // // //             SizedBox(height: 20,),
// // // // // //              Center(
// // // // // //                child: ElevatedButton(
// // // // // //                  onPressed: _saveTask,
// // // // // //                  style: ElevatedButton.styleFrom(
// // // // // //                    backgroundColor: Colors.purple,
// // // // // //                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Reduced padding
// // // // // //                    minimumSize: const Size(100, 40), // Set a smaller minimum size
// // // // // //                    shape: RoundedRectangleBorder(
// // // // // //                      borderRadius: BorderRadius.circular(8),
// // // // // //                    ),
// // // // // //                  ),
// // // // // //                  child: const Text(
// // // // // //                    "Save Task",
// // // // // //                    style: TextStyle(fontSize: 14, color: Colors.white), // Reduced font size
// // // // // //                  ),
// // // // // //                ),
// // // // // //              ),

// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }


// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // // // import 'package:geolocator/geolocator.dart';
// // // // // import 'package:geocoding/geocoding.dart';
// // // // // import 'package:intl/intl.dart';
// // // // // import 'dart:async';

// // // // // class ShowTaskPage extends StatefulWidget {
// // // // //   final String taskId;
// // // // //   final String title;
// // // // //   final String description;

// // // // //   const ShowTaskPage({
// // // // //     Key? key,
// // // // //     required this.taskId,
// // // // //     required this.title,
// // // // //     required this.description,
// // // // //   }) : super(key: key);

// // // // //   @override
// // // // //   State<ShowTaskPage> createState() => _ShowTaskPageState();
// // // // // }

// // // // // class _ShowTaskPageState extends State<ShowTaskPage> {
// // // // //   bool isTaskStarted = false;
// // // // //   String taskStartTime = '';
// // // // //   String taskStatus = 'To Do';
// // // // //   String comment = '';
// // // // //   String currentLocation = '';
// // // // //   String locationName = '';
// // // // //   Position? _currentPosition;
// // // // //   late GoogleMapController mapController;
// // // // //   Set<Marker> _markers = {};

// // // // //   // Timer-related variables
// // // // //   Timer? _timer;
// // // // //   Duration _elapsedTime = Duration.zero;
// // // // //   final TextEditingController _commentController = TextEditingController();

// // // // //    // Add Save Task Logic
// // // // //   void _saveTask() {
// // // // //     // Logic to save the task (e.g., send to backend, store in database, etc.)
// // // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // // //       const SnackBar(content: Text("Task saved successfully!")),
// // // // //     );
// // // // //   }

// // // // //   // Method to request location permissions and fetch current location
// // // // //   Future<void> _getCurrentLocation() async {
// // // // //     bool serviceEnabled;
// // // // //     LocationPermission permission;

// // // // //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// // // // //     if (!serviceEnabled) {
// // // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // // //         const SnackBar(content: Text("Please enable location services.")),
// // // // //       );
// // // // //       return;
// // // // //     }

// // // // //     permission = await Geolocator.checkPermission();
// // // // //     if (permission == LocationPermission.denied) {
// // // // //       permission = await Geolocator.requestPermission();
// // // // //       if (permission == LocationPermission.denied) {
// // // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // // //           const SnackBar(content: Text("Location permission denied.")),
// // // // //         );
// // // // //         return;
// // // // //       }
// // // // //     }

// // // // //     if (permission == LocationPermission.deniedForever) {
// // // // //       ScaffoldMessenger.of(context).showSnackBar(
// // // // //         const SnackBar(
// // // // //             content: Text("Location permission permanently denied.")),
// // // // //       );
// // // // //       return;
// // // // //     }

// // // // //     Position position = await Geolocator.getCurrentPosition(
// // // // //         desiredAccuracy: LocationAccuracy.high);

// // // // //     setState(() {
// // // // //       _currentPosition = position;
// // // // //       currentLocation = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
// // // // //     });

// // // // //     // Reverse geocode to get location name
// // // // //     _getAddressFromLatLng(position.latitude, position.longitude);

// // // // //     // Add marker and update map
// // // // //     _markers.add(
// // // // //       Marker(
// // // // //         markerId: const MarkerId('currentLocation'),
// // // // //         position: LatLng(position.latitude, position.longitude),
// // // // //         infoWindow: const InfoWindow(title: 'Current Location'),
// // // // //       ),
// // // // //     );
// // // // //     mapController.animateCamera(
// // // // //       CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
// // // // //     );
// // // // //   }

// // // // //   // Method to get address from latitude and longitude
// // // // //   Future<void> _getAddressFromLatLng(double lat, double lng) async {
// // // // //     try {
// // // // //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// // // // //       Placemark place = placemarks.first;

// // // // //       setState(() {
// // // // //         // Extract and format the location name
// // // // //         locationName = "${place.locality}, ${place.administrativeArea}";
// // // // //       });
// // // // //     } catch (e) {
// // // // //       setState(() {
// // // // //         locationName = "Unable to fetch location name";
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   // Start/Stop Task
// // // // //   void _startStopTask() {
// // // // //     if (!isTaskStarted) {
// // // // //       setState(() {
// // // // //         isTaskStarted = true;
// // // // //         taskStartTime =
// // // // //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // // // //         _elapsedTime = Duration.zero; // Reset the timer
// // // // //       });

// // // // //       // Start the timer
// // // // //       _startTimer();
// // // // //       // Fetch location when starting the task
// // // // //       _getCurrentLocation();
// // // // //     } else {
// // // // //       setState(() {
// // // // //         isTaskStarted = false;
// // // // //         taskStartTime = '';
// // // // //         currentLocation = '';
// // // // //         locationName = '';
// // // // //         _markers.clear(); // Clear the markers on stop
// // // // //       });

// // // // //       // Stop the timer
// // // // //       _stopTimer();
// // // // //     }
// // // // //   }

// // // // //   // Timer methods
// // // // //   void _startTimer() {
// // // // //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// // // // //       setState(() {
// // // // //         _elapsedTime += const Duration(seconds: 1);
// // // // //       });
// // // // //     });
// // // // //   }

// // // // //   void _stopTimer() {
// // // // //     _timer?.cancel();
// // // // //     _timer = null;
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _stopTimer();
// // // // //     super.dispose();
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final screenWidth = MediaQuery.of(context).size.width;
// // // // //     final screenHeight = MediaQuery.of(context).size.height;

// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: Colors.purple,
// // // // //         title: Text(
// // // // //           widget.title,
// // // // //           style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
// // // // //         ),
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         padding: EdgeInsets.all(screenWidth * 0.04),
// // // // //         child: Column(
// // // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // // //           children: [
// // // // //             // Task Details Card
// // // // //             Card(
// // // // //               shape: RoundedRectangleBorder(
// // // // //                 borderRadius: BorderRadius.circular(12),
// // // // //               ),
// // // // //               elevation: 3,
// // // // //               child: Padding(
// // // // //                 padding: EdgeInsets.all(screenWidth * 0.04),
// // // // //                 child: Column(
// // // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       "Task ID: ${widget.taskId}",
// // // // //                       style: TextStyle(fontSize: screenWidth * 0.04),
// // // // //                     ),
// // // // //                     SizedBox(height: screenWidth * 0.02),
// // // // //                     Row(
// // // // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                       children: [
// // // // //                         Text(
// // // // //                           widget.title,
// // // // //                           style: TextStyle(
// // // // //                             fontSize: screenWidth * 0.05,
// // // // //                             fontWeight: FontWeight.bold,
// // // // //                           ),
// // // // //                         ),
// // // // //                         ElevatedButton(
// // // // //                           onPressed: _startStopTask,
// // // // //                           style: ElevatedButton.styleFrom(
// // // // //                             backgroundColor:
// // // // //                                 isTaskStarted ? Colors.red : Colors.purple,
// // // // //                             shape: RoundedRectangleBorder(
// // // // //                               borderRadius: BorderRadius.circular(8),
// // // // //                             ),
// // // // //                           ),
// // // // //                           child: Text(
// // // // //                             isTaskStarted ? 'Stop Task' : 'Start Task',
// // // // //                             style: TextStyle(
// // // // //                                 color: Colors.white,
// // // // //                                 fontSize: screenWidth * 0.04),
// // // // //                           ),
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                     SizedBox(height: screenWidth * 0.02),
// // // // //                     Text(
// // // // //                       widget.description,
// // // // //                       style: TextStyle(fontSize: screenWidth * 0.04),
// // // // //                     ),
// // // // //                     SizedBox(height: screenWidth * 0.05),
// // // // //                     if (isTaskStarted)
// // // // //                       Column(
// // // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                         children: [
// // // // //                           const Divider(
// // // // //                             color: Colors.purple,
// // // // //                             thickness: 2,
// // // // //                             height: 20,
// // // // //                           ),
// // // // //                           SizedBox(height: screenWidth * 0.02),
// // // // //                           Row(
// // // // //                             children: [
// // // // //                               SizedBox(width: screenWidth * 0.02),
// // // // //                               Text(
// // // // //                                 "Active task : ",
// // // // //                                 style: TextStyle(
// // // // //                                     color: Colors.black,
// // // // //                                     fontWeight: FontWeight.bold,
// // // // //                                     fontSize: screenWidth * 0.045),
// // // // //                               ),
// // // // //                               Text(
// // // // //                                 widget.title,
// // // // //                                 style: TextStyle(
// // // // //                                     color: Colors.purple,
// // // // //                                     fontSize: screenWidth * 0.045),
// // // // //                               )
// // // // //                             ],
// // // // //                           ),
// // // // //                           SizedBox(height: screenWidth * 0.02),
// // // // //                           Column(
// // // // //                             mainAxisAlignment: MainAxisAlignment.start,
// // // // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // // // //                             children: [
// // // // //                               Center(
// // // // //                                 child: RichText(
// // // // //                                     text: TextSpan(
// // // // //                                         text: "Started at ",
// // // // //                                         style: TextStyle(
// // // // //                                             fontSize: screenWidth * 0.04,
// // // // //                                             color: Colors.black),
// // // // //                                         children: [
// // // // //                                       TextSpan(
// // // // //                                           text: " $taskStartTime",
// // // // //                                           style: TextStyle(
// // // // //                                               fontWeight: FontWeight.bold,
// // // // //                                               fontSize: screenWidth * 0.04,
// // // // //                                               color: Colors.black))
// // // // //                                     ])),
// // // // //                               )
// // // // //                             ],
// // // // //                           ),
// // // // //                           SizedBox(height: screenWidth * 0.02),
// // // // //                           Center(
// // // // //                             child: const Icon(Icons.timer, size: 20),
// // // // //                           ),
// // // // //                           Center(
// // // // //                             child: Text(
// // // // //                               " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// // // // //                               style: TextStyle(
// // // // //                                   fontWeight: FontWeight.bold,
// // // // //                                   fontSize: screenWidth * 0.045),
// // // // //                             ),
// // // // //                           ),
// // // // //                           Row(
// // // // //                             mainAxisAlignment:
// // // // //                                 MainAxisAlignment.spaceBetween,
// // // // //                             children: [
// // // // //                               RichText(
// // // // //                                 text: TextSpan(
// // // // //                                     text: "Gps tracking:",
// // // // //                                     style: TextStyle(
// // // // //                                         color: Colors.black,
// // // // //                                         fontSize: screenWidth * 0.05,
// // // // //                                         fontWeight: FontWeight.w400),
// // // // //                                     children: [
// // // // //                                       TextSpan(
// // // // //                                           text: "Active",
// // // // //                                           style: TextStyle(
// // // // //                                               color: Colors.green,
// // // // //                                               fontSize: screenWidth * 0.05,
// // // // //                                               fontWeight: FontWeight.bold))
// // // // //                                     ]),
// // // // //                               ),
// // // // //                               Row(
// // // // //                                 children: [
// // // // //                                   const Icon(Icons.location_pin,
// // // // //                                       size: 20, color: Colors.red),
// // // // //                                   Text(
// // // // //                                     locationName.isNotEmpty
// // // // //                                         ? locationName
// // // // //                                         : 'Fetching location...',
// // // // //                                     style: TextStyle(
// // // // //                                         fontSize: screenWidth * 0.04),
// // // // //                                   ),
// // // // //                                 ],
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                           Container(
// // // // //                             margin: EdgeInsets.symmetric(
// // // // //                                 vertical: screenWidth * 0.02),
// // // // //                             height: screenHeight * 0.3,
// // // // //                             color: Colors.black12,
// // // // //                             child: GoogleMap(
// // // // //                               onMapCreated:
// // // // //                                   (GoogleMapController controller) {
// // // // //                                 mapController = controller;
// // // // //                               },
// // // // //                               initialCameraPosition: CameraPosition(
// // // // //                                 target: _currentPosition != null
// // // // //                                     ? LatLng(
// // // // //                                         _currentPosition!.latitude,
// // // // //                                         _currentPosition!.longitude,
// // // // //                                       )
// // // // //                                     : const LatLng(0.0, 0.0),
// // // // //                                 zoom: 15,
// // // // //                               ),
// // // // //                               markers: _markers,
// // // // //                               myLocationEnabled: true,
// // // // //                               zoomControlsEnabled: false,
// // // // //                             ),
// // // // //                           ),
// // // // //                         ],
// // // // //                       )
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             SizedBox(height: screenWidth * 0.05),
// // // // //             Text(
// // // // //               'Status',
// // // // //               style: TextStyle(
// // // // //                   fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             SizedBox(height: screenWidth * 0.03),
// // // // //             DropdownButtonFormField<String>(
// // // // //               value: taskStatus,
// // // // //               items: ['To Do', 'In Progress', 'Completed']
// // // // //                   .map((status) => DropdownMenuItem(
// // // // //                         value: status,
// // // // //                         child: Text(status,
// // // // //                             style: TextStyle(fontSize: screenWidth * 0.04)),
// // // // //                       ))
// // // // //                   .toList(),
// // // // //               onChanged: (value) {
// // // // //                 setState(() {
// // // // //                   taskStatus = value!;
// // // // //                 });
// // // // //               },
// // // // //               decoration: InputDecoration(
// // // // //                 border: OutlineInputBorder(
// // // // //                   borderRadius: BorderRadius.circular(8),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             SizedBox(height: screenWidth * 0.05),
// // // // //             Text(
// // // // //               'Add Comments',
// // // // //               style: TextStyle(
// // // // //                   fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             SizedBox(height: screenWidth * 0.03),
// // // // //             Row(
// // // // //               children: [
// // // // //                 Expanded(
// // // // //                   child: TextField(
// // // // //                     controller: _commentController,
// // // // //                     maxLines: 2,
// // // // //                     decoration: InputDecoration(
// // // // //                       hintText: 'Enter your comments here',
// // // // //                       border: OutlineInputBorder(
// // // // //                         borderRadius: BorderRadius.circular(8),
// // // // //                       ),
// // // // //                     ),
// // // // //                     onChanged: (value) {
// // // // //                       setState(() {
// // // // //                         comment = value;
// // // // //                       });
// // // // //                     },
// // // // //                   ),
// // // // //                 ),
// // // // //                 // if (comment.trim().isNotEmpty)
// // // // //                 //   IconButton(
// // // // //                 //     icon: const Icon(Icons.send),
// // // // //                 //     onPressed: () {
// // // // //                 //       ScaffoldMessenger.of(context).showSnackBar(
// // // // //                 //         SnackBar(content: Text('Comment submitted: $comment')),
// // // // //                 //       );
// // // // //                 //       _commentController.clear();
// // // // //                 //       setState(() {
// // // // //                 //         comment = '';
// // // // //                 //       });
// // // // //                 //     },
// // // // //                 //   ),
// // // // //               ],
// // // // //             ),
// // // // //             SizedBox(height: screenWidth * 0.10),
// // // // //             Center(
// // // // //               child: ElevatedButton(
// // // // //                 onPressed: _saveTask,
// // // // //                 // style: ElevatedButton.styleFrom(
// // // // //                 //   backgroundColor: Colors.purple,
// // // // //                 //   padding: EdgeInsets.symmetric(
// // // // //                 //       vertical: screenWidth * 0.02,
// // // // //                 //       horizontal: screenWidth * 0.04),
// // // // //                 //   minimumSize: Size(screenWidth * 0.3, screenHeight * 0.05),
// // // // //                 //   shape: RoundedRectangleBorder(
// // // // //                 //     borderRadius: BorderRadius.circular(8),
// // // // //                 //   ),
// // // // //                 // ),
// // // // //                 style: ElevatedButton.styleFrom(
// // // // //                             minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
// // // // //                             backgroundColor: Colors.purple,
// // // // //                             shape: RoundedRectangleBorder(
// // // // //                               borderRadius: BorderRadius.zero,
// // // // //                             ),
// // // // //                           ),
// // // // //                 child: Text(
// // // // //                   "Save Task",
// // // // //                   style: TextStyle(
// // // // //                       fontSize: screenWidth * 0.04, color: Colors.white),
// // // // //                 ),
// // // // //               ),
// // // // //             ),
            

// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // // import 'package:geolocator/geolocator.dart';
// // // // import 'package:geocoding/geocoding.dart';
// // // // import 'package:intl/intl.dart';
// // // // import 'dart:async';

// // // // class ShowTaskPage extends StatefulWidget {
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
// // // //   State<ShowTaskPage> createState() => _ShowTaskPageState();
// // // // }

// // // // class _ShowTaskPageState extends State<ShowTaskPage> {
// // // //   bool isTaskStarted = false;
// // // //   String taskStartTime = '';
// // // //   String taskStatus = 'To Do';
// // // //   String comment = '';
// // // //   String currentLocation = '';
// // // //   String locationName = '';
// // // //   Position? _currentPosition;
// // // //   late GoogleMapController mapController;
// // // //   Set<Marker> _markers = {};

// // // //   // Timer-related variables
// // // //   Timer? _timer;
// // // //   Duration _elapsedTime = Duration.zero;
// // // //   final TextEditingController _commentController = TextEditingController();

// // // //   // Add Save Task Logic
// // // //   void _saveTask() {
// // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // //       const SnackBar(content: Text("Task saved successfully!")),
// // // //     );
// // // //   }

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

// // // //     _getAddressFromLatLng(position.latitude, position.longitude);

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

// // // //   Future<void> _getAddressFromLatLng(double lat, double lng) async {
// // // //     try {
// // // //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// // // //       Placemark place = placemarks.first;

// // // //       setState(() {
// // // //         locationName = "${place.locality}, ${place.administrativeArea}";
// // // //       });
// // // //     } catch (e) {
// // // //       setState(() {
// // // //         locationName = "Unable to fetch location name";
// // // //       });
// // // //     }
// // // //   }

// // // //   void _startStopTask() {
// // // //     if (!isTaskStarted) {
// // // //       setState(() {
// // // //         isTaskStarted = true;
// // // //         taskStartTime =
// // // //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // // //         _elapsedTime = Duration.zero;
// // // //       });

// // // //       _startTimer();
// // // //       _getCurrentLocation();
// // // //     } else {
// // // //       setState(() {
// // // //         isTaskStarted = false;
// // // //         taskStartTime = '';
// // // //         currentLocation = '';
// // // //         locationName = '';
// // // //         _markers.clear();
// // // //       });

// // // //       _stopTimer();
// // // //     }
// // // //   }

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
// // // //   void dispose() {
// // // //     _stopTimer();
// // // //     super.dispose();
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
// // // //                       style: TextStyle(fontSize: screenWidth * 0.04),
// // // //                     ),
// // // //                     SizedBox(height: screenWidth * 0.02),
// // // //                     Row(
// // // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                       children: [
// // // //                         Text(
// // // //                           widget.title,
// // // //                           style: TextStyle(
// // // //                             fontSize: screenWidth * 0.05,
// // // //                             fontWeight: FontWeight.bold,
// // // //                           ),
// // // //                         ),
// // // //                         ElevatedButton(
// // // //                           onPressed: _startStopTask,
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
// // // //                                         : 'Fetching location...',
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
// // // //                       )
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: screenWidth * 0.05),
// // // //             Text(
// // // //               'Status',
// // // //               style: TextStyle(
// // // //                   fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             SizedBox(height: screenWidth * 0.03),
// // // //             DropdownButtonFormField<String>(
// // // //               value: taskStatus,
// // // //               items: ['To Do', 'In Progress', 'Completed']
// // // //                   .map((status) => DropdownMenuItem(
// // // //                         value: status,
// // // //                         child: Text(status,
// // // //                             style: TextStyle(fontSize: screenWidth * 0.04)),
// // // //                       ))
// // // //                   .toList(),
// // // //               onChanged: (value) {
// // // //                 setState(() {
// // // //                   taskStatus = value!;
// // // //                 });
// // // //               },
// // // //               decoration: InputDecoration(
// // // //                 border: OutlineInputBorder(
// // // //                   borderRadius: BorderRadius.circular(8),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: screenWidth * 0.05),
// // // //             Text(
// // // //               'Add Comments',
// // // //               style: TextStyle(
// // // //                   fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             SizedBox(height: screenWidth * 0.03),
// // // //             Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: TextField(
// // // //                     controller: _commentController,
// // // //                     maxLines: 2,
// // // //                     decoration: InputDecoration(
// // // //                       hintText: 'Enter your comments here',
// // // //                       border: OutlineInputBorder(
// // // //                         borderRadius: BorderRadius.circular(8),
// // // //                       ),
// // // //                     ),
// // // //                     onChanged: (value) {
// // // //                       setState(() {
// // // //                         comment = value;
// // // //                       });
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             SizedBox(height: screenWidth * 0.10),
// // // //             Center(
// // // //               child: ElevatedButton(
// // // //                 onPressed: _saveTask,
// // // //                 style: ElevatedButton.styleFrom(
// // // //                   minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
// // // //                   backgroundColor: Colors.purple,
// // // //                   shape: RoundedRectangleBorder(
// // // //                     borderRadius: BorderRadius.zero,
// // // //                   ),
// // // //                 ),
// // // //                 child: Text(
// // // //                   "Save Task",
// // // //                   style: TextStyle(
// // // //                       fontSize: screenWidth * 0.04, color: Colors.white),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }



// // // import 'package:flutter/material.dart';
// // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // import 'package:geolocator/geolocator.dart';
// // // import 'package:geocoding/geocoding.dart';
// // // import 'package:intl/intl.dart';
// // // import 'dart:async';

// // // class ShowTaskPage extends StatefulWidget {
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
// // //   State<ShowTaskPage> createState() => _ShowTaskPageState();
// // // }

// // // class _ShowTaskPageState extends State<ShowTaskPage> {
// // //   bool isTaskStarted = false;
// // //   String taskStartTime = '';
// // //   String taskStatus = 'To Do';
// // //   String comment = '';
// // //   String currentLocation = '';
// // //   String locationName = '';
// // //   Position? _currentPosition;
// // //   late GoogleMapController mapController;
// // //   Set<Marker> _markers = {};

// // //   // Timer-related variables
// // //   Timer? _timer;
// // //   Duration _elapsedTime = Duration.zero;
// // //   final TextEditingController _commentController = TextEditingController();

// // //   // Add Save Task Logic
// // //   void _saveTask() {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       const SnackBar(content: Text("Task saved successfully!")),
// // //     );
// // //   }

// // //   // Request location permissions and fetch current location
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

// // //     setState(() {
// // //       _currentPosition = position;
// // //       currentLocation = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
// // //     });

// // //     _getAddressFromLatLng(position.latitude, position.longitude);

// // //     _markers.add(
// // //       Marker(
// // //         markerId: const MarkerId('currentLocation'),
// // //         position: LatLng(position.latitude, position.longitude),
// // //         infoWindow: const InfoWindow(title: 'Current Location'),
// // //       ),
// // //     );
// // //     mapController.animateCamera(
// // //       CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
// // //     );
// // //   }

// // //   Future<void> _getAddressFromLatLng(double lat, double lng) async {
// // //     try {
// // //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// // //       Placemark place = placemarks.first;

// // //       setState(() {
// // //         locationName = "${place.locality}, ${place.administrativeArea}";
// // //       });
// // //     } catch (e) {
// // //       setState(() {
// // //         locationName = "Unable to fetch location name";
// // //       });
// // //     }
// // //   }

// // //   void _startStopTask() {
// // //     if (!isTaskStarted) {
// // //       setState(() {
// // //         isTaskStarted = true;
// // //         taskStartTime =
// // //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// // //         _elapsedTime = Duration.zero;
// // //       });

// // //       _startTimer();
// // //       _getCurrentLocation();
// // //     } else {
// // //       setState(() {
// // //         isTaskStarted = false;
// // //         taskStartTime = '';
// // //         currentLocation = '';
// // //         locationName = '';
// // //         _markers.clear();
// // //       });

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
// // //   void dispose() {
// // //     _stopTimer();
// // //     super.dispose();
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
// // //                       style: TextStyle(fontSize: screenWidth * 0.04),
// // //                     ),
// // //                     SizedBox(height: screenWidth * 0.02),
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                       children: [
// // //                         Text(
// // //                           widget.title,
// // //                           style: TextStyle(
// // //                             fontSize: screenWidth * 0.05,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                         ),
// // //                         ElevatedButton(
// // //                           onPressed: _startStopTask,
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor:
// // //                                 isTaskStarted ? Colors.red : Colors.purple,
// // //                             shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(8),
// // //                             ),
// // //                             minimumSize: Size(screenWidth * 0.3,
// // //                                 screenHeight * 0.05), // Responsive size
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
// // //                           Center(
// // //                             child: Text(
// // //                               " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// // //                               style: TextStyle(
// // //                                   fontWeight: FontWeight.bold,
// // //                                   fontSize: screenWidth * 0.045),
// // //                             ),
// // //                           ),
// // //                           Row(
// // //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                             children: [
// // //                               RichText(
// // //                                 text: TextSpan(
// // //                                     text: "Gps tracking:",
// // //                                     style: TextStyle(
// // //                                         color: Colors.black,
// // //                                         fontSize: screenWidth * 0.05,
// // //                                         fontWeight: FontWeight.w400),
// // //                                     children: [
// // //                                       TextSpan(
// // //                                           text: "Active",
// // //                                           style: TextStyle(
// // //                                               color: Colors.green,
// // //                                               fontSize: screenWidth * 0.05,
// // //                                               fontWeight: FontWeight.bold))
// // //                                     ]),
// // //                               ),
// // //                               Row(
// // //                                 children: [
// // //                                   const Icon(Icons.location_pin,
// // //                                       size: 20, color: Colors.red),
// // //                                   Text(
// // //                                     locationName.isNotEmpty
// // //                                         ? locationName
// // //                                         : 'Fetching location...',
// // //                                     style:
// // //                                         TextStyle(fontSize: screenWidth * 0.04),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ],
// // //                           ),
// // //                           Container(
// // //                             margin: EdgeInsets.symmetric(
// // //                                 vertical: screenWidth * 0.02),
// // //                             height: screenHeight * 0.3,
// // //                             color: Colors.black12,
// // //                             child: GoogleMap(
// // //                               onMapCreated: (GoogleMapController controller) {
// // //                                 mapController = controller;
// // //                               },
// // //                               initialCameraPosition: CameraPosition(
// // //                                 target: _currentPosition != null
// // //                                     ? LatLng(_currentPosition!.latitude,
// // //                                         _currentPosition!.longitude)
// // //                                     : const LatLng(0.0, 0.0),
// // //                                 zoom: 14,
// // //                               ),
// // //                               markers: _markers,
// // //                             ),
// // //                           ),
// // //                           ElevatedButton(
// // //                               onPressed: _saveTask,
// // //                               child: const Text("Save Task"))
// // //                         ],
// // //                       )
// // //                   ],
// // //                 ),
// // //               ),
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:intl/intl.dart';
// // import 'dart:async';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // class ShowTaskPage extends StatefulWidget {
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
// //   State<ShowTaskPage> createState() => _ShowTaskPageState();
// // }

// // class _ShowTaskPageState extends State<ShowTaskPage> {
// //   bool isTaskStarted = false;
// //   String taskStartTime = '';
// //   String taskStatus = 'To Do';
// //   String comment = '';
// //   String currentLocation = '';
// //   String locationName = '';
// //   Position? _currentPosition;
// //   late GoogleMapController mapController;
// //   Set<Marker> _markers = {};

// //   // Timer-related variables
// //   Timer? _timer;
// //   Duration _elapsedTime = Duration.zero;
// //   final TextEditingController _commentController = TextEditingController();

// //   // Add Save Task Logic
// //   void _saveTask() {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text("Task saved successfully!")),
// //     );
// //   }

// //   // Request location permissions and fetch current location
// //   Future<void> _getCurrentLocation() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;

// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text("Please enable location services.")),
// //       );
// //       return;
// //     }

// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text("Location permission denied.")),
// //         );
// //         return;
// //       }
// //     }

// //     if (permission == LocationPermission.deniedForever) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //             content: Text("Location permission permanently denied.")),
// //       );
// //       return;
// //     }

// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);

// //     setState(() {
// //       _currentPosition = position;
// //       currentLocation = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
// //     });

// //     _getAddressFromLatLng(position.latitude, position.longitude);

// //     _markers.add(
// //       Marker(
// //         markerId: const MarkerId('currentLocation'),
// //         position: LatLng(position.latitude, position.longitude),
// //         infoWindow: const InfoWindow(title: 'Current Location'),
// //       ),
// //     );
// //     mapController.animateCamera(
// //       CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
// //     );
// //   }

// //   Future<void> _getAddressFromLatLng(double lat, double lng) async {
// //     try {
// //       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
// //       Placemark place = placemarks.first;

// //       setState(() {
// //         locationName = "${place.locality}, ${place.administrativeArea}";
// //       });
// //     } catch (e) {
// //       setState(() {
// //         locationName = "Unable to fetch location name";
// //       });
// //     }
// //   }

// //   void _startStopTask() {
// //     if (!isTaskStarted) {
// //       setState(() {
// //         isTaskStarted = true;
// //         taskStartTime =
// //             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
// //         _elapsedTime = Duration.zero;
// //       });

// //       _startTimer();
// //       _getCurrentLocation();
// //     } else {
// //       setState(() {
// //         isTaskStarted = false;
// //         taskStartTime = '';
// //         currentLocation = '';
// //         locationName = '';
// //         _markers.clear();
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

// //   @override
// //   void dispose() {
// //     _stopTimer();
// //     super.dispose();
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
// //           style: TextStyle(color: Colors.white, fontSize: 18.sp),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Task Details Card
// //             Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(12.r),
// //               ),
// //               elevation: 3,
// //               child: Padding(
// //                 padding: EdgeInsets.all(16.w),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       "Task ID: ${widget.taskId}",
// //                       style: TextStyle(fontSize: 14.sp),
// //                     ),
// //                     SizedBox(height: 8.h),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     
// //                       children: [
// //                         Flexible(
// //                           child: Text(
// //                             "jkjkggkkgjkgjjkggkjgjksgj",
// //                             style: TextStyle(
// //                               fontSize: 18.sp,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                             maxLines: 1, // Limits to a single line
// //                             overflow: TextOverflow
// //                                 .ellipsis, // Adds ellipsis if the text overflows
// //                           ),
// //                         ),
// //                         ElevatedButton(
// //                           onPressed: _startStopTask,
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor:
// //                                 isTaskStarted ? Colors.red : Colors.purple,
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(8.r),
// //                             ),
// //                           ),
// //                           child: Text(
                             
// //                             isTaskStarted ? 'Stop Task' : 'Start Task',
// //                             style:
// //                                 TextStyle(color: Colors.white, fontSize: 14.sp),
// //                           ),
                          
// //                         ),
// //                       ],
// //                     ),
// //                     SizedBox(height: 8.h),
// //                     Text(
// //                       widget.description,
// //                       style: TextStyle(fontSize: 14.sp),
// //                     ),
// //                     SizedBox(height: 12.h),
// //                     if (isTaskStarted) ...[
// //                       const Divider(
// //                         color: Colors.purple,
// //                         thickness: 2,
// //                         height: 20,
// //                       ),
// //                       SizedBox(height: 8.h),
// //                       Row(
// //                         children: [
// //                           SizedBox(width: 8.w),
// //                           Text(
// //                             "Active task : ",
// //                             style: TextStyle(
// //                                 color: Colors.black,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 16.sp),
// //                           ),
// //                           Text(
// //                             widget.title,
// //                             style: TextStyle(
// //                                 color: Colors.purple, fontSize: 16.sp),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: 8.h),
// //                       Center(
// //                         child: RichText(
// //                           text: TextSpan(
// //                             text: "Started at ",
// //                             style:
// //                                 TextStyle(fontSize: 14.sp, color: Colors.black),
// //                             children: [
// //                               TextSpan(
// //                                 text: " $taskStartTime",
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 14.sp,
// //                                     color: Colors.black),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: 8.h),
// //                       Center(
// //                         child: Text(
// //                           " ${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}",
// //                           style: TextStyle(
// //                               fontWeight: FontWeight.bold, fontSize: 16.sp),
// //                         ),
// //                       ),
// //                       Container(
// //                         margin: EdgeInsets.symmetric(vertical: 8.h),
// //                         height: 200.h,
// //                         color: Colors.black12,
// //                         child: GoogleMap(
// //                           onMapCreated: (GoogleMapController controller) {
// //                             mapController = controller;
// //                           },
// //                           initialCameraPosition: CameraPosition(
// //                             target: _currentPosition != null
// //                                 ? LatLng(
// //                                     _currentPosition!.latitude,
// //                                     _currentPosition!.longitude,
// //                                   )
// //                                 : const LatLng(0.0, 0.0),
// //                             zoom: 15,
// //                           ),
// //                           markers: _markers,
// //                           myLocationEnabled: true,
// //                           zoomControlsEnabled: false,
// //                         ),
// //                       ),
// //                     ]
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16.h),
// //             // (Rest of the UI similarly updated with ScreenUtil for responsive sizes)
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:intl/intl.dart';
// import 'dart:async';

// class ShowTaskPage extends StatefulWidget {
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
//   State<ShowTaskPage> createState() => _ShowTaskPageState();
// }

// class _ShowTaskPageState extends State<ShowTaskPage> {
//   bool isTaskStarted = false;
//   String taskStartTime = '';
//   String taskStatus = 'To Do';
//   String comment = '';
//   String currentLocation = '';
//   String locationName = '';
//   Position? _currentPosition;
//   late GoogleMapController mapController;
//   Set<Marker> _markers = {};

//   // Timer-related variables
//   Timer? _timer;
//   Duration _elapsedTime = Duration.zero;
//   final TextEditingController _commentController = TextEditingController();

//   // Add Save Task Logic
//   void _saveTask() {
//     // Logic to save the task (e.g., send to backend, store in database, etc.)
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Task saved successfully!")),
//     );
//   }

//   // Method to request location permissions and fetch current location
//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enable location services.")),
//       );
//       return;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Location permission denied.")),
//         );
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text("Location permission permanently denied.")),
//       );
//       return;
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     setState(() {
//       _currentPosition = position;
//       currentLocation = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
//     });

//     // Reverse geocode to get location name
//     _getAddressFromLatLng(position.latitude, position.longitude);

//     // Add marker and update map
//     _markers.add(
//       Marker(
//         markerId: const MarkerId('currentLocation'),
//         position: LatLng(position.latitude, position.longitude),
//         infoWindow: const InfoWindow(title: 'Current Location'),
//       ),
//     );
//     mapController.animateCamera(
//       CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
//     );
//   }

//   // Method to get address from latitude and longitude
//   Future<void> _getAddressFromLatLng(double lat, double lng) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
//       Placemark place = placemarks.first;

//       setState(() {
//         // Extract and format the location name
//         locationName = "${place.locality}, ${place.administrativeArea}";
//       });
//     } catch (e) {
//       setState(() {
//         locationName = "Unable to fetch location name";
//       });
//     }
//   }

//   // Start/Stop Task
//   void _startStopTask() {
//     if (!isTaskStarted) {
//       setState(() {
//         isTaskStarted = true;
//         taskStartTime =
//             DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
//         _elapsedTime = Duration.zero; // Reset the timer
//       });

//       // Start the timer
//       _startTimer();
//       // Fetch location when starting the task
//       _getCurrentLocation();
//     } else {
//       setState(() {
//         isTaskStarted = false;
//         taskStartTime = '';
//         currentLocation = '';
//         locationName = '';
//         _markers.clear(); // Clear the markers on stop
//       });

//       // Stop the timer
//       _stopTimer();
//     }
//   }

//   // Timer methods
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
//   void dispose() {
//     _stopTimer();
//     super.dispose();
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
//             // Task Details Card
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
//                       style: TextStyle(fontSize: screenWidth * 0.04),
//                     ),
//                     SizedBox(height: screenWidth * 0.02),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             "text is long",
//                             maxLines: 2,
//                             // widget.title,
//                             style: TextStyle(
//                               fontSize: screenWidth * 0.05,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: _startStopTask,
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
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                     text: "Gps tracking:",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: screenWidth * 0.05,
//                                         fontWeight: FontWeight.w400),
//                                     children: [
//                                       TextSpan(
//                                           text: "Active",
//                                           style: TextStyle(
//                                               color: Colors.green,
//                                               fontSize: screenWidth * 0.05,
//                                               fontWeight: FontWeight.bold))
//                                     ]),
//                               ),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.location_pin,
//                                       size: 20, color: Colors.red),
//                                   Text(
//                                     locationName.isNotEmpty
//                                         ? locationName
//                                         : 'Fetching location...',
//                                     style:
//                                         TextStyle(fontSize: screenWidth * 0.04),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                                 vertical: screenWidth * 0.02),
//                             height: screenHeight * 0.3,
//                             color: Colors.black12,
//                             child: GoogleMap(
//                               onMapCreated: (GoogleMapController controller) {
//                                 mapController = controller;
//                               },
//                               initialCameraPosition: CameraPosition(
//                                 target: _currentPosition != null
//                                     ? LatLng(
//                                         _currentPosition!.latitude,
//                                         _currentPosition!.longitude,
//                                       )
//                                     : const LatLng(0.0, 0.0),
//                                 zoom: 15,
//                               ),
//                               markers: _markers,
//                               myLocationEnabled: true,
//                               zoomControlsEnabled: false,
//                             ),
//                           ),
//                         ],
//                       )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: screenWidth * 0.05),
//             Text(
//               'Status',
//               style: TextStyle(
//                   fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: screenWidth * 0.03),
//             DropdownButtonFormField<String>(
//               value: taskStatus,
//               items: ['To Do', 'In Progress', 'Completed']
//                   .map((status) => DropdownMenuItem(
//                         value: status,
//                         child: Text(status,
//                             style: TextStyle(fontSize: screenWidth * 0.04)),
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   taskStatus = value!;
//                 });
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             SizedBox(height: screenWidth * 0.05),
//             Text(
//               'Add Comments',
//               style: TextStyle(
//                   fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: screenWidth * 0.03),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _commentController,
//                     maxLines: 2,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your comments here',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         comment = value;
//                       });
//                     },
//                   ),
//                 ),
//                 // if (comment.trim().isNotEmpty)
//                 //   IconButton(
//                 //     icon: const Icon(Icons.send),
//                 //     onPressed: () {
//                 //       ScaffoldMessenger.of(context).showSnackBar(
//                 //         SnackBar(content: Text('Comment submitted: $comment')),
//                 //       );
//                 //       _commentController.clear();
//                 //       setState(() {
//                 //         comment = '';
//                 //       });
//                 //     },
//                 //   ),
//               ],
//             ),
//             SizedBox(height: screenWidth * 0.10),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _saveTask,
//                 // style: ElevatedButton.styleFrom(
//                 //   backgroundColor: Colors.purple,
//                 //   padding: EdgeInsets.symmetric(
//                 //       vertical: screenWidth * 0.02,
//                 //       horizontal: screenWidth * 0.04),
//                 //   minimumSize: Size(screenWidth * 0.3, screenHeight * 0.05),
//                 //   shape: RoundedRectangleBorder(
//                 //     borderRadius: BorderRadius.circular(8),
//                 //   ),
//                 // ),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
//                   backgroundColor: Colors.purple,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero,
//                   ),
//                 ),
//                 child: Text(
//                   "Save Task",
//                   style: TextStyle(
//                       fontSize: screenWidth * 0.04, color: Colors.white),
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
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ShowTaskPage extends StatefulWidget {
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
  State<ShowTaskPage> createState() => _ShowTaskPageState();
}

class _ShowTaskPageState extends State<ShowTaskPage> {
  bool isTaskStarted = false;
  String taskStartTime = '';
  String taskStatus = 'To Do';
  String comment = '';
  String currentLocation = '';
  String locationName = '';
  Position? _currentPosition;
  late GoogleMapController mapController;
  Set<Marker> _markers = {};

  // Timer-related variables
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
  final TextEditingController _commentController = TextEditingController();

  // Add Save Task Logic
  void _saveTask() {
    // Logic to save the task (e.g., send to backend, store in database, etc.)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Task saved successfully!")),
    );
  }

  // Method to request location permissions and fetch current location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enable location services.")),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission denied.")),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Location permission permanently denied.")),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      currentLocation = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
    });

    // Reverse geocode to get location name
    _getAddressFromLatLng(position.latitude, position.longitude);

    // Add marker and update map
    _markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(title: 'Current Location'),
      ),
    );
    mapController.animateCamera(
      CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
    );
  }

  // Method to get address from latitude and longitude
  Future<void> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks.first;

      setState(() {
        // Extract and format the location name
        locationName = "${place.locality}, ${place.administrativeArea}";
      });
    } catch (e) {
      setState(() {
        locationName = "Unable to fetch location name";
      });
    }
  }

  // Start/Stop Task
  void _startStopTask() {
    if (!isTaskStarted) {
      setState(() {
        isTaskStarted = true;
        taskStartTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
        _elapsedTime = Duration.zero; // Reset the timer
      });

      // Start the timer
      _startTimer();
      // Fetch location when starting the task
      _getCurrentLocation();
    } else {
      setState(() {
        isTaskStarted = false;
        taskStartTime = '';
        currentLocation = '';
        locationName = '';
        _markers.clear(); // Clear the markers on stop
      });

      // Stop the timer
      _stopTimer();
    }
  }

  // Timer methods
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
  void dispose() {
    _stopTimer();
    super.dispose();
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
            // Task Details Card
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
                      style: TextStyle(fontSize: screenWidth * 0.04,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          
                          child: Text(
                            // overflow:  TextOverflow.ellipsis
                            // ,
                            // maxLines: 1,
                            widget.title,
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _startStopTask,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "Gps tracking:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.w400),
                                    children: [
                                      TextSpan(
                                          text: "Active",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold))
                                    ]),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_pin,
                                      size: 20, color: Colors.red),
                                  Text(
                                    locationName.isNotEmpty
                                        ? locationName
                                        : 'Fetching location...',
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.04),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: screenWidth * 0.02),
                            height: screenHeight * 0.3,
                            color: Colors.black12,
                            child: GoogleMap(
                              onMapCreated: (GoogleMapController controller) {
                                mapController = controller;
                              },
                              initialCameraPosition: CameraPosition(
                                target: _currentPosition != null
                                    ? LatLng(
                                        _currentPosition!.latitude,
                                        _currentPosition!.longitude,
                                      )
                                    : const LatLng(0.0, 0.0),
                                zoom: 15,
                              ),
                              markers: _markers,
                              myLocationEnabled: true,
                              zoomControlsEnabled: false,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            Text(
              'Status',
              style: TextStyle(
                  fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenWidth * 0.03),
            DropdownButtonFormField<String>(
              value: taskStatus,
              items: ['To Do', 'In Progress', 'Completed']
                  .map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(status,
                            style: TextStyle(fontSize: screenWidth * 0.04)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  taskStatus = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            Text(
              'Add Comments',
              style: TextStyle(
                  fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        comment = value;
                      });
                    },
                  ),
                ),
                // if (comment.trim().isNotEmpty)
                //   IconButton(
                //     icon: const Icon(Icons.send),
                //     onPressed: () {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text('Comment submitted: $comment')),
                //       );
                //       _commentController.clear();
                //       setState(() {
                //         comment = '';
                //       });
                //     },
                //   ),
              ],
            ),
            SizedBox(height: screenWidth * 0.10),
            Center(
              child: ElevatedButton(
                onPressed: _saveTask,
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.purple,
                //   padding: EdgeInsets.symmetric(
                //       vertical: screenWidth * 0.02,
                //       horizontal: screenWidth * 0.04),
                //   minimumSize: Size(screenWidth * 0.3, screenHeight * 0.05),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                // ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Save Task",
                  style: TextStyle(
                      fontSize: screenWidth * 0.04, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
