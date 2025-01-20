import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:time_sheet_app/const/router.dart';
import 'package:time_sheet_app/features/Project_details/views/task_view.dart';
import 'package:time_sheet_app/features/home/models/project_model.dart';
import 'package:time_sheet_app/features/home/models/status_model.dart';
import 'package:time_sheet_app/features/home/provider/project_provider.dart';
import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
import 'package:time_sheet_app/features/home/provider/status_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<ProjectModel> _filteredProjects = [];
  bool  _showRefreshMessage = false;
   bool   isloading = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterProjects(_searchController.text);
    });
    _fetchProjects();
     _fetchStatus();
  }

  Future<void> _fetchProjects() async {
    final notifier = ref.read(userProjectsProvider.notifier);
    await notifier.fetchUserProjects(context: context);
    _filteredProjects = ref.read(userProjectsProvider);
  }
  Future<void> _fetchStatus() async {
    final statusNotifier = ref.read(statusProvider.notifier);
    await statusNotifier.fetchStatus(context: context);
  }

  void _filterProjects(String query) {
    final allProjects = ref.read(userProjectsProvider);
    setState(() {
      _filteredProjects = allProjects
          .where((project) =>
              project.name.toLowerCase().contains(query.toLowerCase()) ||
              project.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Future<void> _refreshData() async {
  //   await _fetchProjects();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Data updated'),
  //       duration: Duration(seconds: 2),
  //     ),
  //   );
  // }
     Future<void> _refreshData() async {
    setState(() {
      _showRefreshMessage = true;
      isloading = true; // Show the message during refresh
    });

    await _fetchProjects();
    await Future.delayed(Duration(seconds: 2)); // Simulate loading time

    setState(() {
      _showRefreshMessage = false;
      isloading = false;
      // Hide the message after refresh
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final projects = ref.watch(userProjectsProvider);
    final statusList = ref.watch(statusProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.06),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: TextField(
                    controller: _searchController,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: _filteredProjects.isEmpty
                      ? Center(child: Text('No projects found'))
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _filteredProjects.length,
                          itemBuilder: (context, index) {
                            final project = _filteredProjects[index];

                                // Match status using project.name
                            final projectStatus = statusList.firstWhere(
                              (status) => status.projectName == project.name,
                              orElse: () => ProjectSatusModel(
                                projectName: project.name,
                                totalTasks: 10,
                                completedTasks: 10,
                                pendingTasks: 5,
                                totalHoursWorked: 0.0,
                              ),
                            );

                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(selectedProjectIdProvider.notifier)
                                    .state = project.id;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProjectDetailedPage(
                                            title: project.name,
                                            subtitle: project.description,
                                          )),
                                );
                              },
                              child: _buildProjectCard(
                                size,
                                title: project.name,
                                subtitle: project.description,
                                // totalTasks: 10,
                                // pendingTasks: 5,
                                // completedTasks: 5,
                                // estimatedHours: 30,
                                // workedHours: 15,

                                totalTasks: projectStatus.totalTasks,
                                pendingTasks: projectStatus.pendingTasks,
                                completedTasks: projectStatus.completedTasks,
                                estimatedHours: 0,
                                workedHours:
                                    projectStatus.totalHoursWorked.toInt(),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                                height:
                                    size.height * 0.02); // Space between cards
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    context.go(AppRouter.login);
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:time_sheet_app/const/router.dart';
// import 'package:time_sheet_app/features/Project_details/views/task_view.dart';
// import 'package:time_sheet_app/features/home/models/project_model.dart';
// import 'package:time_sheet_app/features/home/models/status_model.dart';
// import 'package:time_sheet_app/features/home/provider/project_provider.dart';
// import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
// import 'package:time_sheet_app/features/home/provider/status_provider.dart';

// class HomePage extends ConsumerStatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends ConsumerState<HomePage> {
//   TextEditingController _searchController = TextEditingController();
//   List<ProjectModel> _filteredProjects = [];
//   bool _showRefreshMessage = false;
//   bool isloading = false; // Controls visibility of the refresh message

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(() {
//       _filterProjects(_searchController.text);
//     });
//     _fetchProjects();
//     _fetchStatus();
//   }

//   Future<void> _fetchProjects() async {
//     final notifier = ref.read(userProjectsProvider.notifier);
//     await notifier.fetchUserProjects(context: context);
//     _filteredProjects = ref.read(userProjectsProvider);
//   }

//   Future<void> _fetchStatus() async {
//     final statusNotifier = ref.read(statusProvider.notifier);
//     await statusNotifier.fetchStatus(context: context);
//   }

//   void _filterProjects(String query) {
//     final allProjects = ref.read(userProjectsProvider);
//     setState(() {
//       _filteredProjects = allProjects
//           .where((project) =>
//               project.name.toLowerCase().contains(query.toLowerCase()) ||
//               project.description.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   // Future<void> _refreshData() async {
//   //   setState(() {
//   //     _showRefreshMessage = true;
//   //     isloading = true; // Show the message during refresh
//   //   });

//   //   await _fetchProjects();
//   //   await Future.delayed(Duration(seconds: 1)); // Simulate loading time

//   //   setState(() {
//   //     _showRefreshMessage = false; 
//   //     isloading = false;
//   //     // Hide the message after refresh
//   //   });
//   // }

// Future<void> _refreshData() async {
//     setState(() {
//       _showRefreshMessage = true; // Trigger fade-in
//       isloading = true;
//     });

//     await _fetchProjects(); // Fetch data
//     await Future.delayed(Duration(seconds: 1)); // Simulate delay
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final projects = ref.watch(userProjectsProvider);
//     final statusList = ref.watch(statusProvider);

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey[200],
//         body: Stack(
//           children: [
//             RefreshIndicator(
//               onRefresh: _refreshData,
//               child: isloading== true? AnimatedOpacity(opacity: 0.5, duration:Duration(milliseconds: 300,),child: Text("data"),):  SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Header Section
//                     _buildHeader(size),
//                     SizedBox(height: size.height * 0.02),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                       child: TextField(
//                         controller: _searchController,
//                         decoration: InputDecoration(
//                           hintText: "Search",
//                           prefixIcon: Icon(Icons.search),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(80),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.03),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                       child: Text(
//                         "My projects",
//                         style: TextStyle(
//                           fontSize: size.width * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                       child: _filteredProjects.isEmpty
//                           ? Center(child: Text('No projects found'))
//                           : ListView.separated(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: _filteredProjects.length,
//                               itemBuilder: (context, index) {
//                                 final project = _filteredProjects[index];

//                                 // Match status using project.name
//                                 final projectStatus = statusList.firstWhere(
//                                   (status) =>
//                                       status.projectName == project.name,
//                                   orElse: () => ProjectSatusModel(
//                                     projectName: project.name,
//                                     totalTasks: 10,
//                                     completedTasks: 10,
//                                     pendingTasks: 5,
//                                     totalHoursWorked: 0.0,
//                                   ),
//                                 );

//                                 return GestureDetector(
//                                   onTap: () {
//                                     ref
//                                         .read(
//                                             selectedProjectIdProvider.notifier)
//                                         .state = project.id;

//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               ProjectDetailedPage(
//                                                 title: project.name,
//                                                 subtitle: project.description,
//                                               )),
//                                     );
//                                   },
//                                   child: _buildProjectCard(
//                                     size,
//                                     title: project.name,
//                                     subtitle: project.description,
//                                     totalTasks: projectStatus.totalTasks,
//                                     pendingTasks: projectStatus.pendingTasks,
//                                     completedTasks:
//                                         projectStatus.completedTasks,
//                                     estimatedHours: 0,
//                                     workedHours:
//                                         projectStatus.totalHoursWorked.toInt(),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder: (context, index) {
//                                 return SizedBox(
//                                     height: size.height *
//                                         0.02); // Space between cards
//                               },
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Fade-in and Fade-out Refresh Message
//             Positioned(
//               top: size.height * 0.02,
//               left: 0,
//               right: 0,
//               child: AnimatedOpacity(
//                 opacity: _showRefreshMessage ? 1.0 : 0.0,
//                 duration: Duration(milliseconds: 500), // Animation duration
//                 child: Center(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: size.width * 0.04,
//                         vertical: size.height * 0.01),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.7),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       "Data updated",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: size.width * 0.04,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(Size size) {
//     return Container(
//       width: size.width,
//       height: size.height * 0.3,
//       decoration: BoxDecoration(
//         color: Colors.purple,
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: size.height * 0.06),
//             Text(
//               "Good Morning",
//               style: TextStyle(
//                 fontSize: size.width * 0.06,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: size.height * 0.01),
//             Text(
//               "Lot of tasks are waiting for you",
//               style: TextStyle(
//                 fontSize: size.width * 0.04,
//                 color: Colors.white.withOpacity(0.8),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

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
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: size.width * 0.05,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: size.height * 0.01),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: size.width * 0.04,
//               color: Colors.grey,
//             ),
//           ),
//           SizedBox(height: size.height * 0.02),
//           Text("Total tasks: $totalTasks"),
//           Text("Task pending: $pendingTasks"),
//           Text("Task Completed: $completedTasks"),
//           Text("Estimated Hours: $estimatedHours Hrs"),
//           Text("Hours worked: $workedHours Hrs"),
//         ],
//       ),
//     );
//   }
// }
