


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/home/models/project_model.dart';
import 'package:time_sheet_app/features/home/services/user_project_service.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final userProjectsProvider =
    NotifierProvider<UserProjectsNotifier, List<ProjectModel>>(
  () => UserProjectsNotifier(),
);

class UserProjectsNotifier extends Notifier<List<ProjectModel>> {
  @override
  List<ProjectModel> build() {
    return [];
  }

  Future<void> fetchUserProjects({required BuildContext context}) async {
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final userProjectService = ref.read(userProjectServicesProvider);

    final token = await sharedPrefServices.getToken(); // Retrieve token
    final employeeId =
        await sharedPrefServices.getEmployeeId(); // Retrieve employee ID

    if (token == null || employeeId == null) {
      showErrorSnackbar(
        message: "User not authenticated or employee ID not found.",
        context: context,
      );
      return;
    }

    try {
      final result = await userProjectService.getUserProject(token, employeeId);
      result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message, context: context);
        },
        (projects) {
          state = projects; // Update the state with the fetched projects
        },
      );
    } catch (e) {
      showErrorSnackbar(
        message: "An unexpected error occurred: $e",
        context: context,
      );
    }
  }
}
