class TimesheetUpdateResponseModel {
  final String message;
  final int id;
  final TimesheetUpdateData data;

  TimesheetUpdateResponseModel({
    required this.message,
    required this.id,
    required this.data,
  });

  // Factory method to create an instance from JSON
  factory TimesheetUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    return TimesheetUpdateResponseModel(
      message: json['message'],
      id: json['id'],
      data: TimesheetUpdateData.fromJson(json['data']),
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'id': id,
      'data': data.toJson(),
    };
  }
}

class TimesheetUpdateData {
  final String employee;
  final String project;
  final String task;
  final DateTime startTimestamp;
  final DateTime endTimestamp;
  final String startLocation;
  final String endLocation;
  // final String description;
  final String? description;
  final double hoursWorked;
  final String status;

  TimesheetUpdateData({
    required this.employee,
    required this.project,
    required this.task,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.startLocation,
    required this.endLocation,
    // required this.description,
    this.description,
    required this.hoursWorked,
    required this.status,
  });

  // Factory method to create an instance from JSON
  factory TimesheetUpdateData.fromJson(Map<String, dynamic> json) {
    return TimesheetUpdateData(
      employee: json['employee'],
      project: json['project'],
      task: json['task'],
      startTimestamp: DateTime.parse(json['start_timestamp']),
      endTimestamp: DateTime.parse(json['end_timestamp']),
      startLocation: json['start_location'],
      endLocation: json['end_location'],
      description: json['description'],
      hoursWorked: json['hours_worked'].toDouble(),
      status: json['status'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'employee': employee,
      'project': project,
      'task': task,
      'start_timestamp': startTimestamp.toIso8601String(),
      'end_timestamp': endTimestamp.toIso8601String(),
      'start_location': startLocation,
      'end_location': endLocation,
      'description': description,
      'hours_worked': hoursWorked,
      'status': status,
    };
  }
}
