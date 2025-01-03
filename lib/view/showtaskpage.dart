

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

// class ShowTaskPage extends StatefulWidget {
//   final String taskId;
//   final String title;
//   final String description;

//   const ShowTaskPage({
//     super.key,
//     required this.taskId,
//     required this.title,
//     required this.description,
//   });

//   @override
//   State<ShowTaskPage> createState() => _ShowTaskPageState();
// }

// class _ShowTaskPageState extends State<ShowTaskPage> {
//   bool isTaskStarted = false; // Whether the task is started or not
//   String taskStatus = "Todo"; // Default task status
//   final TextEditingController _commentController = TextEditingController();
//   final List<String> comments = [];
//   Position? _currentPosition;
//   late GoogleMapController mapController;
//   Set<Marker> _markers = {};

//   // Function to request location permissions
//   Future<bool> _checkAndRequestPermissions() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Show a message and return false if location services are not enabled
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Please enable location services.")),
//       );
//       return false;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Show a message and return false if permission is denied
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Location permission denied.")),
//         );
//         return false;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Show a message and return false if permission is denied forever
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Location permission permanently denied.")),
//       );
//       return false;
//     }

//     return true;
//   }

//   // Fetch current location
//   Future<void> _getCurrentLocation() async {
//     bool hasPermission = await _checkAndRequestPermissions();
//     if (!hasPermission) return;

//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       _currentPosition = position;
//       _markers.add(Marker(
//         markerId: MarkerId('currentLocation'),
//         position: LatLng(position.latitude, position.longitude),
//         infoWindow: InfoWindow(title: 'Current Location'),
//       ));
//     });
//     mapController.animateCamera(CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
//   }

//   // Function to handle task start (from ProjectDetailedPage)
//   void startTask() {
//     setState(() {
//       isTaskStarted = !isTaskStarted; // Toggle task state
//       if (isTaskStarted) {
//         taskStatus = "In Progress"; // Change status when task is started
//         _getCurrentLocation(); // Start fetching location
//       } else {
//         taskStatus = "Todo"; // Reset status when task is stopped
//       }
//     });
//     // Optionally show a message indicating task has started or stopped
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(isTaskStarted ? 'Task Started' : 'Task Stopped'),
//         backgroundColor: isTaskStarted ? Colors.green : Colors.red,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: const Text('Task Details', style: TextStyle(color: Colors.white)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Task Details
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Task ID: ${widget.taskId}",
//                       style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 1, 1, 1)),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       widget.title,
//                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       widget.description,
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Start/Stop Task Button
//             ElevatedButton(
//               onPressed: startTask,  // Call startTask function here
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: isTaskStarted ? Colors.red : Colors.purple,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: Text(
//                 isTaskStarted ? 'Stop Task' : 'Start Task',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Update Task Status
//             Text(
//               "Update Task Status",
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               value: taskStatus,
//               items: ["Todo", "In Progress", "Completed"]
//                   .map((status) => DropdownMenuItem(
//                         value: status,
//                         child: Text(status),
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
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Add Comments
//             Text(
//               "Add Comment",
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _commentController,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 hintText: "Write your comment here...",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 if (_commentController.text.isNotEmpty) {
//                   setState(() {
//                     comments.add(_commentController.text);
//                     _commentController.clear();
//                   });
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.purple,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text("Add Comment", style: TextStyle(color: Colors.white)),
//             ),

//             const SizedBox(height: 20),

//             // Display Comments
//             if (comments.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Comments",
//                     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   ...comments.map((comment) => Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 4.0),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           elevation: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Text(comment),
//                           ),
//                         ),
//                       )),
//                 ],
//               ),

//             const SizedBox(height: 20),

//             // GPS Tracking Section
//             if (isTaskStarted)
//               Column(
//                 children: [
//                   Text(
//                     'GPS Tracking: Active',
//                     style: TextStyle(color: Colors.green, fontSize: 18),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     height: 250,
//                     child: GoogleMap(
//                       onMapCreated: (GoogleMapController controller) {
//                         mapController = controller;
//                       },
//                       initialCameraPosition: CameraPosition(
//                         target: _currentPosition != null
//                             ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
//                             : LatLng(0.0, 0.0), // Set to a fallback position if no location is available
//                         zoom: 15,
//                       ),
//                       markers: _markers,
//                     ),
//                   ),
//                 ],
//               ),
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
  String currentLocation = '';
  String locationName = ''; 
  String taskStatus = 'To Do';
  String comment = '';
  Position? _currentPosition;
  late GoogleMapController mapController;
  Set<Marker> _markers = {};

  // Method to request location permissions and fetch location
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
        const SnackBar(content: Text("Location permission permanently denied.")),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      currentLocation =
          'Lat: ${position.latitude}, Lng: ${position.longitude}';
    });

    // Reverse geocode to get location name
    _getAddressFromLatLng(position.latitude, position.longitude);

    // Update the map
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
        locationName =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      setState(() {
        locationName = "Unable to fetch location name";
      });
    }
  }

  // Start or Stop Task
  void _startStopTask() {
    if (!isTaskStarted) {
      setState(() {
        isTaskStarted = true;
        taskStartTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      });
      _getCurrentLocation();
    } else {
      setState(() {
        isTaskStarted = false;
        taskStartTime = '';
        currentLocation = '';
        locationName = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
           widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task ID: ${widget.taskId}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Start/Stop Button
            ElevatedButton(
              onPressed: _startStopTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: isTaskStarted ? Colors.red : Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isTaskStarted ? 'Stop Task' : 'Start Task',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            // const SizedBox(height: 20),

            // // Status Section
            // const Text(
            //   'Status',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),
            // Row(
            //   children: [
            //     const SizedBox(width: 10),
            //     Expanded(
            //       child: DropdownButtonFormField<String>(
            //         value: taskStatus,
            //         items: ['To Do', 'In Progress', 'Completed']
            //             .map((status) => DropdownMenuItem(
            //                   value: status,
            //                   child: Text(status),
            //                 ))
            //             .toList(),
            //         onChanged: (value) {
            //           setState(() {
            //             taskStatus = value!;
            //           });
            //         },
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 20),

            // // Add Comments Section
            // const Text(
            //   'Add Comments',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),
            // TextField(
            //   maxLines: 3,
            //   decoration: InputDecoration(
            //     hintText: 'Enter your comments here',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       comment = value;
            //     });
            //   },
            // ),
            

            const SizedBox(height: 20),

            // Display Start Time and GPS Data
            if (isTaskStarted) ...[
              Text(
                "Task Started At: $taskStartTime",
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_pin, color: Colors.purple),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      locationName.isNotEmpty
                          ? locationName
                          : 'Fetching location...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Google Map
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
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
              ),
            ],
             const SizedBox(height: 20),

            // Status Section
            const Text(
              'Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: taskStatus,
                    items: ['To Do', 'In Progress', 'Completed']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
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
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Add Comments Section
            const Text(
              'Add Comments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your comments here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  comment = value;
                });
              },
            ),
          ],
          
        ),
      ),
    );
  }
}