// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:time_sheet_app/features/Project_details/provider/task_provider.dart';

// class TaskViewPage extends ConsumerWidget {
//   const TaskViewPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Accessing the TaskUserProvider
//     final tasks = ref.watch(taskUserProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tasks'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () async {
//               // Trigger fetchTask to reload tasks
//              await ref
//                   .read(taskUserProvider.notifier)
//                   .fetchTask(context: context);

//             },
//           ),
//         ],
//       ),

//       // body: tasks.isEmpty
//       //     ? const Center(
//       //         child:
//       //             Text('No tasks available. Select a project to load tasks.'),
//       //       )
//           // :
//           body:  ListView.builder(
//               itemCount: tasks.length,

//               itemBuilder: (context, index) {
//                 final task = tasks[index];
//                print(task);

//                 return Card(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: ListTile(
//                     title: Text(task.title),
//                     subtitle: Text(task.description),
//                     trailing: Text('${task.completionPercentage}% completed'),
//                     onTap: () {
//                       // Navigate to task details or perform any action
//                       showDialog(
//                         context: context,
//                         builder: (_) => AlertDialog(
//                           title: Text(task.title),
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Priority: ${task.priority}'),
//                               Text('Status: ${task.status}'),
//                               Text('Due: ${task.dueDate.toLocal()}'),
//                             ],
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text('Close'),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/Project_details/provider/task_provider.dart';
import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheet_status_provider.dart';
import 'package:time_sheet_app/features/show_tasks/views/show_tasks_view.dart';

import 'package:time_sheet_app/view/add_comment_page.dart';
// import 'package:time_sheet_app/view/showtaskpage.dart';

class ProjectDetailedPage extends ConsumerStatefulWidget {
  final String title;
  final String subtitle;

  const ProjectDetailedPage({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  _ProjectDetailedPageState createState() => _ProjectDetailedPageState();
}

class _ProjectDetailedPageState extends ConsumerState<ProjectDetailedPage> {
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();
    // Fetch tasks when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskUserProvider.notifier).fetchTask(context: context);
    });
  }

  Future<void> _refreshTasks() async {
    setState(() {
      opacity = 0.1; // Start fade-out animation
    });

    await Future.delayed(const Duration(milliseconds: 300)); // Wait for fade-out

    // Fetch tasks
    await ref.read(taskUserProvider.notifier).fetchTask(context: context);

    setState(() {
      opacity = 1.0; // Start fade-in animation
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tasks = ref.watch(taskUserProvider);
    // final projecTitle = ref.read(selectProjectTitleProvider);
final projectTitle =
        ref.read(selectProjectTitleProvider) ;
        print(projectTitle);
 final status =    ref.read(selectedTimesheetStatusProvider);
        

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
        // projectTitle!,
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body:  RefreshIndicator(
        onRefresh: _refreshTasks,
        
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
           physics: const AlwaysScrollableScrollPhysics(),
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
                      Text(
                        widget.subtitle,
                        style: const TextStyle(fontSize: 14),
                      ),
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
                  
              // Task List
              tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks available.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return  AnimatedOpacity(
                          opacity: opacity,
                          duration: const Duration(milliseconds: 300),
                          child:
                        TaskCard(
                          status: status,
                          taskId: task.id.toString(),
                          taskTitle: task.title,
                          taskDescription: task.description,
                          )
                        );
                        
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  final String taskId;
  final String taskTitle;
  final String taskDescription;
  final String status;

  const TaskCard({
    Key? key,
    required this.taskId,
    required this.taskTitle,
    required this.taskDescription,
    required this.status
  }) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isExpanded = false;
  String selectedStatus = "To Do";

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
            // Task Title and Show Task Button
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowTaskPage(
                          taskId: widget.taskId,
                          title: widget.taskTitle,
                          description: widget.taskDescription,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Show Task',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Task Description with "Show More"/"Show Less"
            Text(
              isExpanded
                  ? widget.taskDescription
                  : widget.taskDescription.length > 50
                      ? '${widget.taskDescription.substring(0, 50)}...'
                      : widget.taskDescription,
              style: TextStyle(
                fontSize: screenWidth > 600 ? 16 : 14,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'Show Less' : 'Show More',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Buttons: Status Dropdown and Comments
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Status:  ',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.black38,
                    ),
                    children: [
                      TextSpan(
                        text: widget.status,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentsPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Comments",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
