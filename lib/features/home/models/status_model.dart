class ProjectStatisticsResponse {
  final String message;
  final List<ProjectSatusModel> data;

  ProjectStatisticsResponse({required this.message, required this.data});

  // Factory method to parse JSON into this model
  factory ProjectStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return ProjectStatisticsResponse(
      message: json['message'],
      data: List<ProjectSatusModel>.from(
          json['data'].map((project) => ProjectSatusModel.fromJson(project))),
    );
  }

  // Method to convert this model back to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'message': message,
  //     'data': data.map((project) => project.toJson()).toList(),
  //   };
  // }
}

class ProjectSatusModel {
  final String projectName;
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final double totalHoursWorked;

  ProjectSatusModel({
    required this.projectName,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.totalHoursWorked,
  });

  // Factory method to parse JSON into this model
  factory ProjectSatusModel.fromJson(Map<String, dynamic> json) {
    return ProjectSatusModel(
      projectName: json['project_name'],
      totalTasks: json['total_tasks'],
      completedTasks: json['completed_tasks'],
      pendingTasks: json['pending_tasks'],
      totalHoursWorked: (json['total_hours_worked'] as num).toDouble(),
    );
  }

  // Method to convert this model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'project_name': projectName,
      'total_tasks': totalTasks,
      'completed_tasks': completedTasks,
      'pending_tasks': pendingTasks,
      'total_hours_worked': totalHoursWorked,
    };
  }
}
