import 'package:flutter/material.dart';

import 'package:time_sheet_app/model/project_model.dart';
import 'package:time_sheet_app/services/project_fetch.dart';

class ProjectProvider with ChangeNotifier {
  List<Project> _projects = [];
  bool _isLoading = true;

  List<Project> get projects => _projects;
  bool get isLoading => _isLoading;

  Future<void> loadProjects() async {
    try {
      _isLoading = true;
      notifyListeners();

      final service = ProjectService();
      final data = await service.fetchProjects();

      // Decode the response into Project objects
      _projects = data.map<Project>((json) => Project.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching projects: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}