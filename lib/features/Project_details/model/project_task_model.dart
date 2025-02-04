

// // class TaskModel {
// //   final int id;
// //   final String title;
// //   final String description;
// //   final int project;
// //   final List<AssignedUser> assignedTo;
// //   final String priority;
// //   final String status;
// //   final DateTime dueDate;
// //   final DateTime createdAt;
// //   final DateTime updatedAt;
// //   final int completionPercentage;

// //   TaskModel({
// //     required this.id,
// //     required this.title,
// //     required this.description,
// //     required this.project,
// //     required this.assignedTo,
// //     required this.priority,
// //     required this.status,
// //     required this.dueDate,
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.completionPercentage,
// //   });

// //   factory TaskModel.fromJson(Map<String, dynamic> json) {
// //     return TaskModel(
// //       id: json['id'],
// //       title: json['title'],
// //       description: json['description'],
// //       project: json['project'],
// //       assignedTo: (json['assigned_to'] as List)
// //           .map((user) => AssignedUser.fromJson(user))
// //           .toList(),
// //       priority: json['priority'],
// //       status: json['status'],
// //       dueDate: DateTime.parse(json['due_date']),
// //       createdAt: DateTime.parse(json['created_at']),
// //       updatedAt: DateTime.parse(json['updated_at']),
// //       completionPercentage: json['completion_percentage'],
// //     );
// //   }
// // }

// // class AssignedUser {
// //   final int id;
// //   final String user;
// //   final String name;
// //   final String email;
// //   final String phoneNumber;

// //   AssignedUser({
// //     required this.id,
// //     required this.user,
// //     required this.name,
// //     required this.email,
// //     required this.phoneNumber,
// //   });

// //   factory AssignedUser.fromJson(Map<String, dynamic> json) {
// //     return AssignedUser(
// //       id: json['id'],
// //       user: json['user'],
// //       name: json['name'],
// //       email: json['email'],
// //       phoneNumber: json['phone_number'],
// //     );
// //   }
// // }

// // class TaskResponse {
// //   final List<TaskModel> data;

// //   TaskResponse({
// //     required this.data,
// //   });

// //   factory TaskResponse.fromJson(Map<String, dynamic> json) {
// //     return TaskResponse(
// //       data: (json['data'] as List)
// //           .map((project) => TaskModel.fromJson(project))
// //           .toList(),
// //     );
// //   }
// // }


// class TaskModel {
//   final int id;
//   final String title;
//   final String description;
//   final int project;
//   final List<AssignedTo> assignedTo;
//   final String priority;
//   final String status;
//   // final DateTime dueDate;
//   final DateTime? dueDate;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int completionPercentage;

//   TaskModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.project,
//     required this.assignedTo,
//     required this.priority,
//     required this.status,
//     // required this.dueDate,
//     this.dueDate,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.completionPercentage,
//   });

//   factory TaskModel.fromJson(Map<String, dynamic> json) {
//     return TaskModel(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       project: json['project'],
//       assignedTo: (json['assigned_to'] as List)
//           .map((assigned) => AssignedTo.fromJson(assigned))
//           .toList(),
//       priority: json['priority'],
//       status: json['status'],
//       // dueDate: DateTime.parse(json['due_date']),
//       dueDate: json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       completionPercentage: json['completion_percentage'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'description': description,
//       'project': project,
//       'assigned_to': assignedTo.map((assigned) => assigned.toJson()).toList(),
//       'priority': priority,
//       'status': status,
//       // 'due_date': dueDate.toIso8601String(),
//        'due_date': dueDate?.toIso8601String(),
//       'created_at': createdAt.toIso8601String(),
//       'updated_at': updatedAt.toIso8601String(),
//       'completion_percentage': completionPercentage,
//     };
//   }
// }

// class AssignedTo {
//   final int id;
//   final String user;
//   final String name;
//   final String email;
//   final String phoneNumber;

//   AssignedTo({
//     required this.id,
//     required this.user,
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//   });

//   factory AssignedTo.fromJson(Map<String, dynamic> json) {
//     return AssignedTo(
//       id: json['id'],
//       user: json['user'],
//       name: json['name'],
//       email: json['email'],
//       phoneNumber: json['phone_number'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user': user,
//       'name': name,
//       'email': email,
//       'phone_number': phoneNumber,
//     };
//   }
// }

// class TaskResponse {
//   final String message;
//   final List<TaskModel> data;
//   final int projectProgress;

//   TaskResponse({
//     required this.message,
//     required this.data,
//     required this.projectProgress,
//   });

//   factory TaskResponse.fromJson(Map<String, dynamic> json) {
//     return TaskResponse(
//       message: json['message'],
//       data: (json['data'] as List)
//           .map((task) => TaskModel.fromJson(task))
//           .toList(),
//       projectProgress: json['project_progress'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'data': data.map((task) => task.toJson()).toList(),
//       'project_progress': projectProgress,
//     };
//   }
// }





class TaskModel {
  final int taskAssignmentId;
  final String taskTitle;
  final String? taskDescription; // Nullable in case it's missing
  final String status; // "TODO", "IN_PROGRESS", "COMPLETED"
  final String priority; // "HIGH", "MEDIUM", "LOW"
  final DateTime? dueDate; // Nullable if the date is missing

  TaskModel({
    required this.taskAssignmentId,
    required this.taskTitle,
    this.taskDescription,
    required this.status,
    required this.priority,
    this.dueDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskAssignmentId: json['task_assignment_id'] as int,
      taskTitle: json['task_title'] as String,
      taskDescription: json['task_description'] as String?,
      status: json['status'] as String,
      priority: json['priority'] as String,
      dueDate:
          json['due_date'] != null ? DateTime.tryParse(json['due_date']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_assignment_id': taskAssignmentId,
      'task_title': taskTitle,
      'task_description': taskDescription,
      'status': status,
      'priority': priority,
      'due_date': dueDate?.toIso8601String(), // Avoids null errors
    };
  }
}

class TaskResponse {
  final int totalTasks;
  final int totalCompleted;
  final int totalTodo;
  final int totalInProgress;
  final List<TaskModel> tasks;
  final AvailableFilters availableFilters;

  TaskResponse({
    required this.totalTasks,
    required this.totalCompleted,
    required this.totalTodo,
    required this.totalInProgress,
    required this.tasks,
    required this.availableFilters,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    return TaskResponse(
      totalTasks: json['total_tasks'] as int,
      totalCompleted: json['total_completed'] as int,
      totalTodo: json['total_todo'] as int,
      totalInProgress: json['total_in_progress'] as int,
      tasks: (json['tasks'] as List<dynamic>)
          .map((task) => TaskModel.fromJson(task))
          .toList(),
      availableFilters: AvailableFilters.fromJson(json['available_filters']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_tasks': totalTasks,
      'total_completed': totalCompleted,
      'total_todo': totalTodo,
      'total_in_progress': totalInProgress,
      'tasks': tasks.map((task) => task.toJson()).toList(),
      'available_filters': availableFilters.toJson(),
    };
  }
}

class AvailableFilters {
  final List<String> searchFields;
  final List<String> sortFields;
  final FilterOptions filterOptions;

  AvailableFilters({
    required this.searchFields,
    required this.sortFields,
    required this.filterOptions,
  });

  factory AvailableFilters.fromJson(Map<String, dynamic> json) {
    return AvailableFilters(
      searchFields: (json['search_fields'] as List<dynamic>).cast<String>(),
      sortFields: (json['sort_fields'] as List<dynamic>).cast<String>(),
      filterOptions: FilterOptions.fromJson(json['filter_options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'search_fields': searchFields,
      'sort_fields': sortFields,
      'filter_options': filterOptions.toJson(),
    };
  }
}

class FilterOptions {
  final List<String> status;
  final List<String> priority;

  FilterOptions({
    required this.status,
    required this.priority,
  });

  factory FilterOptions.fromJson(Map<String, dynamic> json) {
    return FilterOptions(
      status: (json['status'] as List<dynamic>?)?.cast<String>() ?? [],
      priority: (json['priority'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'priority': priority,
    };
  }
}