import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/const/router.dart';

import 'package:time_sheet_app/features/show_tasks/models/timesheet_update_model.dart';

import 'package:time_sheet_app/features/show_tasks/services/time_sheet_updation_services.dart';

import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final timesheetUpdateProvider =
    NotifierProvider<TimesheetUpdateProvider, bool>(
  () => TimesheetUpdateProvider(),
);

class TimesheetUpdateProvider extends Notifier<bool> {
  @override
  bool build() {
    return false; // Initial state, not loading
  }


  Future<void> updateTimesheet({
    required BuildContext context,
    required TimesheetUpdateModel timesheetData,
  }) async {
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final timesheetUpdateservice = ref.read(timesheetServiceProvider);
    final timesheetId = ref.read(timesheetIdProvider);

    if (timesheetId == null) {
      showErrorSnackbar(
        message: "Timesheet ID not found. Please create a timesheet first.",
        context: context,
      );
      return;
    }

    try {
      final token = await sharedPrefServices.getToken();
      if (token == null) {
        showErrorSnackbar(
          message: "User not authenticated or token not found.",
          context: context,
        );
        return;
      }

      final result = await timesheetUpdateservice.updateTimesheet(
        data: timesheetData,
        token: token,
        id: timesheetId, // Use the stored ID
      );

      result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message, context: context);
        },
        (success) {
          if (context.mounted) {
            // Handle success and navigate
            context.go(AppRouter.home);
          }
        },
      );
    } catch (e) {
      showErrorSnackbar(
        message: "An error occurred: $e",
        context: context,
      );
    } finally {
      state = false;
    }
  }
}
