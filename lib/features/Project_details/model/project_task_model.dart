

// class TaskModel {
//   final int id;
//   final String title;
//   final String description;
//   final int project;
//   final List<AssignedUser> assignedTo;
//   final String priority;
//   final String status;
//   final DateTime dueDate;
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
//     required this.dueDate,
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
//           .map((user) => AssignedUser.fromJson(user))
//           .toList(),
//       priority: json['priority'],
//       status: json['status'],
//       dueDate: DateTime.parse(json['due_date']),
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       completionPercentage: json['completion_percentage'],
//     );
//   }
// }

// class AssignedUser {
//   final int id;
//   final String user;
//   final String name;
//   final String email;
//   final String phoneNumber;

//   AssignedUser({
//     required this.id,
//     required this.user,
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//   });

//   factory AssignedUser.fromJson(Map<String, dynamic> json) {
//     return AssignedUser(
//       id: json['id'],
//       user: json['user'],
//       name: json['name'],
//       email: json['email'],
//       phoneNumber: json['phone_number'],
//     );
//   }
// }

// class TaskResponse {
//   final List<TaskModel> data;

//   TaskResponse({
//     required this.data,
//   });

//   factory TaskResponse.fromJson(Map<String, dynamic> json) {
//     return TaskResponse(
//       data: (json['data'] as List)
//           .map((project) => TaskModel.fromJson(project))
//           .toList(),
//     );
//   }
// }


class TaskModel {
  final int id;
  final String title;
  final String description;
  final int project;
  final List<AssignedTo> assignedTo;
  final String priority;
  final String status;
  // final DateTime dueDate;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int completionPercentage;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.project,
    required this.assignedTo,
    required this.priority,
    required this.status,
    // required this.dueDate,
    this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    required this.completionPercentage,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      project: json['project'],
      assignedTo: (json['assigned_to'] as List)
          .map((assigned) => AssignedTo.fromJson(assigned))
          .toList(),
      priority: json['priority'],
      status: json['status'],
      // dueDate: DateTime.parse(json['due_date']),
      dueDate: json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      completionPercentage: json['completion_percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'project': project,
      'assigned_to': assignedTo.map((assigned) => assigned.toJson()).toList(),
      'priority': priority,
      'status': status,
      // 'due_date': dueDate.toIso8601String(),
       'due_date': dueDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'completion_percentage': completionPercentage,
    };
  }
}

class AssignedTo {
  final int id;
  final String user;
  final String name;
  final String email;
  final String phoneNumber;

  AssignedTo({
    required this.id,
    required this.user,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory AssignedTo.fromJson(Map<String, dynamic> json) {
    return AssignedTo(
      id: json['id'],
      user: json['user'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
    };
  }
}

class TaskResponse {
  final String message;
  final List<TaskModel> data;
  final int projectProgress;

  TaskResponse({
    required this.message,
    required this.data,
    required this.projectProgress,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    return TaskResponse(
      message: json['message'],
      data: (json['data'] as List)
          .map((task) => TaskModel.fromJson(task))
          .toList(),
      projectProgress: json['project_progress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.map((task) => task.toJson()).toList(),
      'project_progress': projectProgress,
    };
  }
}
