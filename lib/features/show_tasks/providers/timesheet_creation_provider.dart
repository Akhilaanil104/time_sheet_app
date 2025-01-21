// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/common/shared_pref_provider.dart';
// import 'package:time_sheet_app/features/show_tasks/services/timesheet_creation_service.dart';

// final timesheetCreationProvider =
//     NotifierProvider<TimesheetCreationProvider, bool>(
//   () => TimesheetCreationProvider(),
// );

// class TimesheetCreationProvider extends Notifier<bool> {
//   @override

//   bool build() {
//     return false;
//   }

//   Future<void> postTimesheet({
//     required BuildContext context,
//   }) async {
//     state = true;

//     final timesheetServices = ref.read(timesheetServiceProvider);
//     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
//     final result = await timesheetServices.postTimesheet(data: data, token: token)

//   }
// }

// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:time_sheet_app/common/shared_pref_provider.dart';
// import 'package:time_sheet_app/const/router.dart';
// import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// import 'package:time_sheet_app/features/show_tasks/services/timesheet_creation_service.dart';
// import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

// final timesheetCreationProvider =
//     NotifierProvider<TimesheetCreationProvider, bool>(
//   () => TimesheetCreationProvider(),
// );

// class TimesheetCreationProvider extends Notifier<bool> {
//   @override
//   bool build() {
//     return false; // Initial state, not loading
//   }

//   Future<void> postTimesheet({
//     required BuildContext context,
//     required TimeSheetModel timesheetData, // Timesheet data to be sent
//   }) async {
//     state = true; // Set loading state to true
//     final timesheetServices = ref.read(timesheetServiceProvider);
//     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
//   final token = await sharedPrefServices.getToken();
//      if (token == null ) {
//       showErrorSnackbar(
//         message:
//             "User not authenticated or employee ID not found or NoTask found.",
//         context: context,
//       );
//       return;
//     }

//       try{
//         final result = await timesheetServices.postTimesheet(
//         data: timesheetData, token: token);
//         result.fold(
//         (failure)
//         {
//           state= false ;
//           // Handle failure
//           showErrorSnackbar(message: failure.message, context: context);
//         },
//         (value){
//       state = false;
//       if(context.mounted){
//         context.go(AppRouter.home);
//       }
//         }

//       }
//   }
// }

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/const/router.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
import 'package:time_sheet_app/features/show_tasks/services/timesheet_creation_service.dart';
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

//   Future<void> postTimesheet({
//     required BuildContext context,
//     required TimeSheetModel timesheetData, // Timesheet data to be sent
//   }) async {
//     state = true; // Set loading state to true

//     final timesheetServices = ref.read(timesheetServiceProvider);
//     final sharedPrefServices = ref.read(sharedPrefServicesProvider);

//     try {
//       // Retrieve token
//       final token = await sharedPrefServices.getToken();
//       if (token == null) {
//         showErrorSnackbar(
//           message: "User not authenticated or token not found.",
//           context: context,
//         );
//         return;
//       }

//       // Call the service to post the timesheet
//       final result = await timesheetServices.postTimesheet(
//         data: timesheetData, // Convert timesheetData to JSON
//         token: token,
//       );

//       // Handle the result
//       result.fold(
//         (failure) {
//           // Handle failure
//           showErrorSnackbar(message: failure.message, context: context);
//         },
//         (success) {
//           // Handle success and navigate to home
//           if (context.mounted) {
//             context.go(AppRouter.home);
//           }
//         },
//       );
//     } catch (e) {
//       // Handle unexpected errors
//       showErrorSnackbar(
//         message: "An error occurred: $e",
//         context: context,
//       );
//     } finally {
//       // Ensure loading state is reset
//       state = false;
//     }
//   }
// }

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
