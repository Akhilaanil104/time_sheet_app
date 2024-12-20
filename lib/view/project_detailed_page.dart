// import 'package:flutter/material.dart';

// class ProjectDetailedPage extends StatefulWidget {
//   @override
//   _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
// }

// class _ProjectDetailedPageState extends State<ProjectDetailedPage> {
//   final List<bool> _isExpanded = [false, false]; // Track "Show More"/"Show Less" state for each task

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
//           onPressed: () {
            
//           },
//         ),
//         title: const Text(
//           'Certifier-Web Application',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Description Card
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
//                       'Certifier-Web application',
//                       style: TextStyle(
//                         fontSize: screenWidth > 600 ? 22 : 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'We need a visually appealing, user-friendly, and responsive design for the Home Page of our certificate issuing and validating platform. The page should effectively communicate the platform\'s purpose, features, and benefits to different target audiences (Companies, Partners, Brands, and General Public).',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       'The design should include interactive elements, intuitive navigation, and clear calls-to-action (CTAs). The goal is to create a high-conversion landing page that is both informative and engaging.',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Tasks Header
//             Text(
//               'Tasks',
//               style: TextStyle(
//                 fontSize: screenWidth > 600 ? 20 : 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),

//             // Task Cards
//             TaskCard(
//               taskTitle: 'Design the Home Page',
//               taskDescription:
//                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
//               isTaskCompleted: false,
//               isExpanded: _isExpanded[0],
//               onToggle: () {
//                 setState(() {
//                   _isExpanded[0] = !_isExpanded[0];
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             TaskCard(
//               taskTitle: 'Design the "Pricing" Page',
//               taskDescription:
//                   '1. Tagline: "Digitize Your Credentials – Issue, Verify, and Validate with Confidence".\n2. Navigation Menu: Home, About Us, Features, Pricing, Contact Us.',
//               isTaskCompleted: false,
//               isExpanded: _isExpanded[1],
//               onToggle: () {
//                 setState(() {
//                   _isExpanded[1] = !_isExpanded[1];
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TaskCard extends StatelessWidget {
//   final String taskTitle;
//   final String taskDescription;
//   final bool isTaskCompleted;
//   final bool isExpanded;
//   final VoidCallback onToggle;

//   const TaskCard({
//     required this.taskTitle,
//     required this.taskDescription,
//     this.isTaskCompleted = false,
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
//             // Task Title with Start Task Button on the Right
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     taskTitle,
//                     style: TextStyle(
//                       fontSize: screenWidth > 600 ? 18 : 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text('Start task'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             // Task Description with "Show More"/"Show Less"
//             Text(
//               isExpanded
//                   ? taskDescription
//                   : '${taskDescription.split("\n")[0]}\n${taskDescription.split("\n")[1].substring(0, 25)}...', // Show limited text when collapsed
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

//             const SizedBox(height: 12),

//             // Task Completed Checkbox
//             Row(
//               children: [
//                 Checkbox(
//                   value: isTaskCompleted,
//                   onChanged: (value) {},
//                 ),
//                 const Text('Task completed'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

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

class TaskCard extends StatelessWidget {
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
                    taskTitle,
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 18 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Start task'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Task Description with "Show More"/"Show Less"
            Text(
              isExpanded
                  ? taskDescription
                  : '${taskDescription.split("\n")[0]}\n${taskDescription.split("\n")[1].substring(0, 25)}...', // Show limited text when collapsed
              style: TextStyle(
                fontSize: screenWidth > 600 ? 16 : 14,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: onToggle,
              child: Text(
                isExpanded ? 'Show Less' : 'Show More',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Task Completed Checkbox
            Row(
              children: [
                Checkbox(
                  value: isTaskCompleted,
                  onChanged: (value) {},
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