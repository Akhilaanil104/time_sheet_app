// // class ProjectModel {
// //   final int id;
// //   final String name;
// //   final String description;
// //   final DateTime startDate;
// //   final DateTime endDate;
// //   final bool assignedAll;
// //   final List<dynamic> assignedTo;

// //   ProjectModel({
// //     required this.id,
// //     required this.name,
// //     required this.description,
// //     required this.startDate,
// //     required this.endDate,
// //     required this.assignedAll,
// //     required this.assignedTo,
// //   });

// //   // Factory constructor to create a ProjectModel from a JSON map
// //   factory ProjectModel.fromJson(Map<String, dynamic> json) {
// //     return ProjectModel(
// //       id: json['id'],
// //       name: json['name'],
// //       description: json['description'],
// //       startDate: DateTime.parse(json['start_date']),
// //       endDate: DateTime.parse(json['end_date']),
// //       assignedAll: json['assigned_all'],
// //       assignedTo: List<dynamic>.from(json['assigned_to']),
// //     );
// //   }

// //   // Method to convert ProjectModel to JSON map
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'name': name,
// //       'description': description,
// //       'start_date': startDate.toIso8601String(),
// //       'end_date': endDate.toIso8601String(),
// //       'assigned_all': assignedAll,
// //       'assigned_to': assignedTo,
// //     };
// //   }

// // }


// import 'dart:convert';

// class ProjectModel {
//   final int id;
//   final String name;
//   final String description;
//   final DateTime startDate;
//   final DateTime endDate;
//   final bool assignedAll;
//   final List<int> assignedTo;

//   ProjectModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.startDate,
//     required this.endDate,
//     required this.assignedAll,
//     required this.assignedTo,
//   });

//   factory ProjectModel.fromJson(Map<String, dynamic> json) {
//     return ProjectModel(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       startDate: DateTime.parse(json['start_date']),
//       endDate: DateTime.parse(json['end_date']),
//       assignedAll: json['assigned_all'],
//       assignedTo: List<int>.from(json['assigned_to']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//       'start_date': startDate.toIso8601String(),
//       'end_date': endDate.toIso8601String(),
//       'assigned_all': assignedAll,
//       'assigned_to': assignedTo,
//     };
//   }
// }

// class ProjectResponse {
//   final String message;
//   final List<ProjectModel> data;

//   ProjectResponse({
//     required this.message,
//     required this.data,
//   });

//   factory ProjectResponse.fromJson(Map<String, dynamic> json) {
//     return ProjectResponse(
//       message: json['message'],
//       data: (json['data'] as List)
//           .map((project) => ProjectModel.fromJson(project))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'data': data.map((project) => project.toJson()).toList(),
//     };
//   }
// }


class ProjectModel {
  final int id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool assignedAll;
  final List<int> assignedTo;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.assignedAll,
    required this.assignedTo,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      assignedAll: json['assigned_all'],
      assignedTo: List<int>.from(json['assigned_to']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'assigned_all': assignedAll,
      'assigned_to': assignedTo,
    };
  }
}

class ProjectResponse {
  final String message;
  final List<ProjectModel> data;

  ProjectResponse({
    required this.message,
    required this.data,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> json) {
    return ProjectResponse(
      message: json['message'],
      data: (json['data'] as List)
          .map((project) => ProjectModel.fromJson(project))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.map((project) => project.toJson()).toList(),
    };
  }
}
