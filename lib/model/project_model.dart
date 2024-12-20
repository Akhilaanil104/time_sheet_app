class Project {
  final int id;
  final String name;
  final String description;
  final String startDate;
  final String endDate;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }
}