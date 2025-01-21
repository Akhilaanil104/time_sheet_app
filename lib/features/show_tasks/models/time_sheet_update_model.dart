class TimesheetUpdateModel {
  final int id;
  final DateTime startTimestamp;
  final DateTime endTimestamp;
  final String startLocation;
  final String endLocation;
  final String description;
  final String status;
  final double hoursWorked;
  final int employee;
  final int project;
  final int task;

  TimesheetUpdateModel({
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
  });

  // Factory method to create an instance from JSON
  factory TimesheetUpdateModel.fromJson(Map<String, dynamic> json) {
    return TimesheetUpdateModel(
      id: json['id'],
      startTimestamp: DateTime.parse(json['start_timestamp']),
      endTimestamp: DateTime.parse(json['end_timestamp']),
      startLocation: json['start_location'],
      endLocation: json['end_location'],
      description: json['description'],
      status: json['status'],
      hoursWorked: double.parse(json['hours_worked']),
      employee: json['employee'],
      project: json['project'],
      task: json['task'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_timestamp': startTimestamp.toIso8601String(),
      'end_timestamp': endTimestamp.toIso8601String(),
      'start_location': startLocation,
      'end_location': endLocation,
      'description': description,
      'status': status,
      'hours_worked': hoursWorked.toStringAsFixed(2),
      'employee': employee,
      'project': project,
      'task': task,
    };
  }
}
