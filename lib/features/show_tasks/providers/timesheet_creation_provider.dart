
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
// final timesheetIdProvider = StateProvider<int?>((ref) => null);

// class TimesheetCreationProvider extends Notifier<bool> {
//   @override
//   bool build() {
//     return false; // Initial state, not loading
//   }

//   Future<void> postTimesheet({
//     required BuildContext context,
//     required TimeSheetModel timesheetData,
//   }) async {
//     state = true; // Set loading state to true

//     final timesheetServices = ref.read(timesheetServiceProvider);
//     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
//     final timesheetIdNotifier = ref.read(timesheetIdProvider.notifier);

//     try {
//       final token = await sharedPrefServices.getToken();
//       if (token == null) {
//         showErrorSnackbar(
//           message: "User not authenticated or token not found.",
//           context: context,
//         );
//         return;
//       }

//       final result = await timesheetServices.postTimesheet(
//         data: timesheetData,
//         token: token,
//       );

//       result.fold(
//         (failure) {
//           showErrorSnackbar(message: failure.message, context: context);
//         },
//         (success) {
//           // Store the ID in the provider
//           timesheetIdNotifier.state = success.id;

//           if (context.mounted) {
//             context.go(AppRouter.home);
//           }
//         },
//       );
//     } catch (e) {
//       showErrorSnackbar(
//         message: "An error occurred: $e",
//         context: context,
//       );
//     } finally {
//       state = false;
//     }
//   }
// }






import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
import 'package:time_sheet_app/features/show_tasks/services/timesheet_creation_service.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheetid_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

/// **Provider to manage timesheet creation**
final timesheetCreationProvider = StateNotifierProvider<TimesheetCreationProvider, bool>(
  (ref) => TimesheetCreationProvider(ref),
);

/// **Handles timesheet creation and stores Task ID**
class TimesheetCreationProvider extends StateNotifier<bool> {
  final Ref ref;

  TimesheetCreationProvider(this.ref) : super(false);

  /// **Post timesheet and store the Task ID**
  Future<void> postTimesheet({
    required BuildContext context,
    required TimeSheetModel timesheetData,
  
  }) async {
    state = true; // Start loading
final sharedPre = ref.read(sharedPrefServicesProvider);
    final timesheetService = ref.read(timesheetServiceProvider);
    final token = await sharedPre.getToken();

    try {
      final response = await timesheetService.postTimesheet(
        data: timesheetData,
        token: token!,
      );

      // response.fold(
      //   (failure) {
      //     showErrorSnackbar(message: failure.message, context: context);
      //   },
      //   (successData) {
      //     showSuccessSnackbar(message: "Timesheet created successfully!", context: context);
          
      //     // Store the task ID in the taskIdProvider
          
        
      //     print("✅ Stored Task ID: ${successData.id}");
      //   },
      // );



//       response.fold(
//   (failure) {
//     showErrorSnackbar(message: failure.message, context: context);
//   },
//   (successData) {
//     if (successData.id == null) {
//       showErrorSnackbar(message: "API did not return a valid Timesheet ID!", context: context);
//       return;
//     }

//     // ✅ Store the timesheet ID
//     ref.read(timesheetIdProvider.notifier).state = successData.id;
//     print("✅ Stored Timesheet ID in Provider: ${successData.id}");
    
//     showSuccessSnackbar(message: "Timesheet created successfully!", context: context);
//   },
// );


response.fold(
  (failure) {
    showErrorSnackbar(message: failure.message, context: context);
  },
  (successData) {
    final int? newTimesheetId = successData.id;

    if (newTimesheetId == null) {
      showErrorSnackbar(message: "❌ API did not return a valid Timesheet ID!", context: context);
      return;
    }

    // ✅ Ensure provider is updated properly
    ref.read(timesheetIdProvider.notifier).state = newTimesheetId;
    print("✅ Stored Timesheet ID in Provider: ${ref.read(timesheetIdProvider)}");

    showSuccessSnackbar(message: "Timesheet created successfully!", context: context);
  },
);


    } catch (e) {
      showErrorSnackbar(message: "An error occurred: $e", context: context);
    } finally {
      state = false; // Stop loading
    }
  }
}
