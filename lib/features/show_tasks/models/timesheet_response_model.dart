class ResponseTimeSheetData {
  final String message;
  final TimeSheetDataResponse data;

  ResponseTimeSheetData({
    required this.message,
    required this.data,
  });

  // Factory method to create an instance from JSON
  factory ResponseTimeSheetData.fromJson(Map<String, dynamic> json) {
    return ResponseTimeSheetData(
      message: json['message'],
      data: TimeSheetDataResponse.fromJson(json['data']),
    );
  }
}

class TimeSheetDataResponse {
  final int id;
  final DateTime startTimestamp;
  final DateTime endTimestamp;
  final String startLocation;
  final String endLocation;
  final String description;
  final String status;
  final String hoursWorked;
  final int employee;
  final int project;
  final int task;
  final int? taskAssignment; // Nullable field

  TimeSheetDataResponse({
    required this.id,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.startLocation,
    required this.endLocation,
    required this.description,
    required this.status,
    required this.hoursWorked,
    required this.employee,
    required this.project,
    required this.task,
    this.taskAssignment,
  });

  // Factory method to create an instance from JSON
  factory TimeSheetDataResponse.fromJson(Map<String, dynamic> json) {
    return TimeSheetDataResponse(
      id: json['id'],
      startTimestamp: DateTime.parse(json['start_timestamp']),
      endTimestamp: DateTime.parse(json['end_timestamp']),
      startLocation: json['start_location'],
      endLocation: json['end_location'],
      description: json['description'],
      status: json['status'],
      hoursWorked: json['hours_worked'],
      employee: json['employee'],
      project: json['project'],
      task: json['task'],
      taskAssignment: json['task_assignment'],
    );
  }
}