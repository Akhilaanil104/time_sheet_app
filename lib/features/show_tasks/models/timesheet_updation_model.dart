// class TimeSheetUpdateModel {
//   final int id;
//   final String startLocation;
//   final String endLocation;
//   final String description;
//   final String status;
//   final DateTime startTimestamp;
//   final DateTime endTimestamp;
//   final String hoursWorked;
//   final int employee;
//   final int project;
//   final int task;
//   final int? taskAssignment;

//   TimeSheetUpdateModel({
//     required this.id,
//     required this.startLocation,
//     required this.endLocation,
//     required this.description,
//     required this.status,
//     required this.startTimestamp,
//     required this.endTimestamp,
//     required this.hoursWorked,
//     required this.employee,
//     required this.project,
//     required this.task,
//     this.taskAssignment,
//   });

//   /// Factory method to create a model from JSON response
//   factory TimeSheetUpdateModel.fromJson(Map<String, dynamic> json) {
//     return TimeSheetUpdateModel(
//       id: json['id'],
//       startLocation: json['start_location'],
//       endLocation: json['end_location'],
//       description: json['description'],
//       status: json['status'],
//       startTimestamp: DateTime.parse(json['start_timestamp']),
//       endTimestamp: DateTime.parse(json['end_timestamp']),
//       hoursWorked: json['hours_worked'].toString(),
//       employee: json['employee'],
//       project: json['project'],
//       task: json['task'],
//       taskAssignment: json['task_assignment'],
//     );
//   }

//   /// Converts model to JSON for API request
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id, // Include this if required for updating
//       "start_location": startLocation,
//       "end_location": endLocation,
//       "description": description,
//       "status": status,
//       "start_timestamp": startTimestamp.toIso8601String(),
//       "end_timestamp": endTimestamp.toIso8601String(),
//     };
//   }
// }





class TimeSheetUpdateModel {
  final int id;
  final String startLocation;
  final String endLocation;
  final String description;
  final String status;
  final DateTime startTimestamp;
  final DateTime endTimestamp;
  final String hoursWorked;
  final int employee;
  final int project;
  final int task;

  TimeSheetUpdateModel({
    required this.id,
    required this.startLocation,
    required this.endLocation,
    required this.description,
    required this.status,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.hoursWorked,
    required this.employee,
    required this.project,
    required this.task,
  });

  factory TimeSheetUpdateModel.fromJson(Map<String, dynamic> json) {
    return TimeSheetUpdateModel(
      id: json['id'] ?? 0,  // ✅ Fix: Ensure `id` is never null
      startLocation: json['start_location'] ?? '',
      endLocation: json['end_location'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      startTimestamp: DateTime.parse(json['start_timestamp'] ?? DateTime.now().toIso8601String()),
      endTimestamp: DateTime.parse(json['end_timestamp'] ?? DateTime.now().toIso8601String()),
      hoursWorked: json['hours_worked']?.toString() ?? '0',
      employee: json['employee'] ?? 0,
      project: json['project'] ?? 0,
      task: json['task'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "start_location": startLocation,
      "end_location": endLocation,
      "description": description,
      "status": status,
      "start_timestamp": startTimestamp.toIso8601String(),
      "end_timestamp": endTimestamp.toIso8601String(),
    };
  }
}
