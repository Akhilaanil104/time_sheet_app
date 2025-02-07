// class TimeSheetModel {
//   final int projectId;
//   final int employeeId;
//   final int taskId;
//   final DateTime startTimestamp;
//   final DateTime endTimestamp;
//   final String startLocation;
//   final String endLocation;
//   final String description;

//   TimeSheetModel({
//     required this.projectId,
//     required this.employeeId,
//     required this.taskId,
//     required this.startTimestamp,
//     required this.endTimestamp,
//     required this.startLocation,
//     required this.endLocation,
//     required this.description,
//   });

//   // Factory method to create an instance from JSON
//   factory TimeSheetModel.fromJson(Map<String, dynamic> json) {
//     return TimeSheetModel(
//       projectId: json['project_id'],
//       employeeId: json['employee_id'],
//       taskId: json['task_id'],
//       startTimestamp: DateTime.parse(json['start_timestamp']),
//       endTimestamp: DateTime.parse(json['end_timestamp']),
//       startLocation: json['start_location'],
//       endLocation: json['end_location'],
//       description: json['description'],
//     );
//   }

//   // Method to convert an instance to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'project_id': projectId,
//       'employee_id': employeeId,
//       'task_id': taskId,
//       'start_timestamp': startTimestamp.toIso8601String(),
//       'end_timestamp': endTimestamp.toIso8601String(),
//       'start_location': startLocation,
//       'end_location': endLocation,
//       'description': description,
//     };
//   }
// }



// {
//     "task_assignment_id": 2,
//     "start_location": "Office",
//     "end_location": "Client Site",
//     "description": "Working on task",
//     "status": "ONGOING",
//     "start_timestamp": "2025-01-29T07:00:00Z",
//     "end_timestamp": "2025-01-29T17:00:00Z",
//     "state": "Dubai",
//     "city": "Dubai",
//     "street": "Sheikh Zayed Road",
//     "country": "UAE",
//     "postal_code": "12345",
//     "current_longitude": 55.2708,  // Add this
//     "current_latitude": 25.2048    // Add this
// }
class TimeSheetModel {
  
  final int taskAssignmentId;
  final DateTime startTimestamp;
  final DateTime endTimestamp;
  final String startLocation;
  final String endLocation;
  final String description;
  final String status;
  final String state;
  final String city;
  final String street;
  final String country;
  final String postalCode;
  final double currentLongitude;
  final double currentLatitude;

  TimeSheetModel({
    required this.taskAssignmentId,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.startLocation,
    required this.endLocation,
    required this.description,
    required this.status,
    required this.state,
    required this.city,
    required this.street,
    required this.country,
    required this.postalCode,
    required this.currentLongitude,
    required this.currentLatitude,
  });

  // Factory method to create an instance from JSON
  factory TimeSheetModel.fromJson(Map<String, dynamic> json) {
    return TimeSheetModel(
      taskAssignmentId: json['task_assignment_id'],
      startTimestamp: DateTime.parse(json['start_timestamp']),
      endTimestamp: DateTime.parse(json['end_timestamp']),
      startLocation: json['start_location'],
      endLocation: json['end_location'],
      description: json['description'],
      status: json['status'],
      state: json['state'],
      city: json['city'],
      street: json['street'],
      country: json['country'],
      postalCode: json['postal_code'],
      currentLongitude: json['current_longitude'].toDouble(),
      currentLatitude: json['current_latitude'].toDouble(),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'task_assignment_id': taskAssignmentId,
      'start_timestamp': startTimestamp.toIso8601String(),
      'end_timestamp': endTimestamp.toIso8601String(),
      'start_location': startLocation,
      'end_location': endLocation,
      'description': description,
      'status': status,
      'state': state,
      'city': city,
      'street': street,
      'country': country,
      'postal_code': postalCode,
      'current_longitude': currentLongitude,
      'current_latitude': currentLatitude,
    };
  }
}
