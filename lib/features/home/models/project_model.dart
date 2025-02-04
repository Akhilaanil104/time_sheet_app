





class ProjectModel {
  final int projectId;
  final String projectName;
  final String projectDescription;
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final double totalHoursWorked;

  ProjectModel({
    required this.projectId,
    required this.projectName,
    required this.projectDescription,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.totalHoursWorked,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      projectId: json['project_id'],
      projectName: json['project_name'],
      projectDescription: json['project_description'],
      totalTasks: json['total_tasks'],
      completedTasks: json['completed_tasks'],
      pendingTasks: json['pending_tasks'],
      totalHoursWorked: json['total_hours_worked'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'project_name': projectName,
      'project_description': projectDescription,
      'total_tasks': totalTasks,
      'completed_tasks': completedTasks,
      'pending_tasks': pendingTasks,
      'total_hours_worked': totalHoursWorked,
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