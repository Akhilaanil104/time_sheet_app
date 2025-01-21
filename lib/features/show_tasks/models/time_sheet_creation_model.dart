class TimeSheetModel {
  final int projectId;
  final int employeeId;
  final int taskId;
  final DateTime startTimestamp;
  final DateTime endTimestamp;
  final String startLocation;
  final String endLocation;
  final String description;

  TimeSheetModel({
    required this.projectId,
    required this.employeeId,
    required this.taskId,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.startLocation,
    required this.endLocation,
    required this.description,
  });

  // Factory method to create an instance from JSON
  factory TimeSheetModel.fromJson(Map<String, dynamic> json) {
    return TimeSheetModel(
      projectId: json['project_id'],
      employeeId: json['employee_id'],
      taskId: json['task_id'],
      startTimestamp: DateTime.parse(json['start_timestamp']),
      endTimestamp: DateTime.parse(json['end_timestamp']),
      startLocation: json['start_location'],
      endLocation: json['end_location'],
      description: json['description'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'employee_id': employeeId,
      'task_id': taskId,
      'start_timestamp': startTimestamp.toIso8601String(),
      'end_timestamp': endTimestamp.toIso8601String(),
      'start_location': startLocation,
      'end_location': endLocation,
      'description': description,
    };
  }
}
