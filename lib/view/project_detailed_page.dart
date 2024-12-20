

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProjectDetailedPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const ProjectDetailedPage(
      {super.key, required this.title, required this.subtitle});
  @override
  _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
}

class _ProjectDetailedPageState extends State<ProjectDetailedPage> {
  final List<bool> _isExpanded = [
    false,
    false
  ]; // Track "Show More"/"Show Less" state for each task

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
            // Description Card
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
                      widget.title,
                      style: TextStyle(
                        fontSize: screenWidth > 600 ? 22 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // const Text(
                    //   'We need a visually appealing, user-friendly, and responsive design for the Home Page of our certificate issuing and validating platform. The page should effectively communicate the platform\'s purpose, features, and benefits to different target audiences (Companies, Partners, Brands, and General Public).',
                    //   style: TextStyle(fontSize: 14),
                    // ),
                    // const SizedBox(height: 8),
                    // const Text(
                    //   'The design should include interactive elements, intuitive navigation, and clear calls-to-action (CTAs). The goal is to create a high-conversion landing page that is both informative and engaging.',
                    //   style: TextStyle(fontSize: 14),
                    // ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tasks Header
            Text(
              'Tasks',
              style: TextStyle(
                fontSize: screenWidth > 600 ? 20 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Task Cards
            TaskCard(
              taskTitle: 'Design the Home Page',
              taskDescription:
                  '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
              isTaskCompleted: false,
              isExpanded: _isExpanded[0],
              onToggle: () {
                setState(() {
                  _isExpanded[0] = !_isExpanded[0];
                });
              },
            ),
            const SizedBox(height: 10),
            TaskCard(
              taskTitle: 'Design the "Pricing" Page',
              taskDescription:
                  '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
              isTaskCompleted: false,
              isExpanded: _isExpanded[1],
              onToggle: () {
                setState(() {
                  _isExpanded[1] = !_isExpanded[1];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  final String taskTitle;
  final String taskDescription;
  final bool isTaskCompleted;
  final bool isExpanded;
  final VoidCallback onToggle;

  const TaskCard({
    required this.taskTitle,
    required this.taskDescription,
    this.isTaskCompleted = false,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isTaskStarted = false;
  bool isTaskCompleted = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title with Start Task Button on the Right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.taskTitle,
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 18 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.purple,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                //   child: const Text('Start task'),
                // ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isTaskStarted) {
                        // Task is stopped
                        isTaskStarted = false;
                        isTaskCompleted = true;
                      } else {
                        // Task is started
                        isTaskStarted = true;
                        isTaskCompleted = false;
                      }
                    });
                  },
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
              ],
            ),
            const SizedBox(height: 8),

            // Task Description with "Show More"/"Show Less"
            Text(
              widget.isExpanded
                  ? widget.taskDescription
                  : '${widget.taskDescription.split("\n")[0]}\n${widget.taskDescription.split("\n")[1].substring(0, 25)}...', // Show limited text when collapsed
              style: TextStyle(
                fontSize: screenWidth > 600 ? 16 : 14,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: widget.onToggle,
              child: Text(
                widget.isExpanded ? 'Show Less' : 'Show More',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Task Completed Checkbox
            //  isTaskStarted ? Column(children: [
            //   Divider(color: Colors.purple,
            //   ),

            //  ],) :   Row(
            //       children: [
            //         Checkbox(
            //           value: widget.isTaskCompleted,
            //           onChanged: (value) {},
            //         ),
            //         const Text('Task completed'),
            //       ],
            //     ),

            isTaskStarted
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Divider
                      const Divider(
                        color: Colors.purple,
                        thickness: 2,
                        height: 20,
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            "Active task : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Text(
                            " Design the Home Page",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      // Active Task Section
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RichText(
                                text: TextSpan(text: "Started at ",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black
                                    ),
                                    children: [
                                  TextSpan(text: "9:AM",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black))
                                ])),
                          )
                        ],
                      ),


                      SizedBox(
                        height: 10,
                      ),
                      // Started Time
                   
                      Center(   child:   const Icon(Icons.timer, size: 20),),
                    
                      Center(
                        child: const Text(
                          "04:00:00",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),

                      // Timer
                  

                      // GPS Tracking
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(text: TextSpan(
                            text:  "Gps tracking:",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(text: "Active", style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.bold))
                            ]
                          ),
                          ),
                          
                          Row(children: [
                               const Icon(Icons.location_pin,
                              size: 20, color: Colors.red),
                          const Text("Kaloor", style: TextStyle(fontSize: 20),),
                          ],),
                      
                       
                        ],

                      ),

                      // Map Placeholder (Replace with actual map widget if needed)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 200,
                        color: Colors.black12,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(10.0104, 76.2939),
                            zoom: 14, // Adjust zoom level as needed
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId('kaloor_marker'),
                              position:  LatLng(10.0104, 76.2939),
                              infoWindow: const InfoWindow(title: "Kaloor"),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor
                                    .hueRed, // Red marker for the location
                              ),
                            ),
                          },
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Checkbox(
                        value: widget.isTaskCompleted,
                        onChanged: (value) {
                          // Handle checkbox state change
                        },
                      ),
                      const Text('Task completed'),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

