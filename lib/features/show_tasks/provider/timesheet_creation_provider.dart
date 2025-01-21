
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/const/router.dart';

import 'package:time_sheet_app/features/show_tasks/models/timesheet_creation_model.dart';
import 'package:time_sheet_app/features/show_tasks/services/timesheet_creation_servce.dart';

import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final timesheetCreationProvider =
    NotifierProvider<TimesheetCreationProvider, bool>(
  () => TimesheetCreationProvider(),
);
final timesheetIdProvider = StateProvider<int?>((ref) => null);

class TimesheetCreationProvider extends Notifier<bool> {
  @override
  bool build() {
    return false; // Initial state, not loading
  }



  Future<void> postTimesheet({
    required BuildContext context,
    required TimeSheetModel timesheetData,
  }) async {
    state = true; // Set loading state to true

    final timesheetServices = ref.read(timesheetServiceProvider);
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final timesheetIdNotifier = ref.read(timesheetIdProvider.notifier);

    try {
      final token = await sharedPrefServices.getToken();
      if (token == null) {
        showErrorSnackbar(
          message: "User not authenticated or token not found.",
          context: context,
        );
        return;
      }

      final result = await timesheetServices.postTimesheet(
        data: timesheetData,
        token: token,
      );

      result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message, context: context);
        },
        (success) {
          // Store the ID in the provider
          timesheetIdNotifier.state = success.id;

          if (context.mounted) {
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
