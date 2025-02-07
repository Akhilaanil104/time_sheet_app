// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart';
// // import 'package:time_sheet_app/features/show_tasks/services/time_service.dart';
// // import 'package:time_sheet_app/features/show_tasks/services/timesheet_updation_service.dart';
// // import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';
// // import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// // final timesheetUpdateProvider =
// //     NotifierProvider.autoDispose<TimesheetUpdateProvider, bool>(
// //   () => TimesheetUpdateProvider(),
// // );

// // class TimesheetUpdateProvider extends Notifier<bool> {
// //   late final TimesheetUpdateService _timesheetUpdateService;
// //   late final SharedPrefServices _sharedPrefServices;

// //   @override
// //   bool build() {
// //     _timesheetUpdateService = ref.read(timesheetUpdateServiceProvider);
// //     _sharedPrefServices = ref.read(sharedPrefServicesProvider);
// //     return false; // Initial state
// //   }

// //   Future<TimeSheetUpdateModel?> updateTimesheet({
// //     required BuildContext context,
// //     required int timesheetId,
// //     required TimeSheetUpdateModel timesheetData,
// //   }) async {
// //     state = true; // Start loading state

// //     try {
// //       final token = await _sharedPrefServices.getToken();
// //       if (token == null) {
// //         showErrorSnackbar(
// //           message: "User not authenticated or token not found.",
// //           context: context,
// //         );
// //         return null;
// //       }

// //       final result = await _timesheetUpdateService.updateTimesheet(
// //         timesheetId: timesheetId,
// //         data: timesheetData,
// //         token: token,
// //       );

// //       return result.fold(
// //         (failure) {
// //           showErrorSnackbar(message: failure.message, context: context);
// //           return null;
// //         },
// //         (successData) {
// //           showSuccessSnackbar(message: "Timesheet updated successfully!", context: context);
// //           return successData;
// //         },
// //       );
// //     } catch (e) {
// //       showErrorSnackbar(
// //         message: "An error occurred: $e",
// //         context: context,
// //       );
// //       return null;
// //     } finally {
// //       state = false; // Stop loading state
// //     }
// //   }
// // }





// import 'package:flutter/widgets.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/common/shared_pref_provider.dart';

// import 'package:time_sheet_app/features/show_tasks/models/timesheet_updation_model.dart';
// import 'package:time_sheet_app/features/show_tasks/services/timesheet_updation_service.dart';

// import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';
// import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

// /// **Fix: Use `AutoDisposeNotifierProvider` instead of `NotifierProvider`**
// final timesheetUpdateProvider =
//     AutoDisposeNotifierProvider<TimesheetUpdateProvider, bool>(
//   TimesheetUpdateProvider.new,
// );

// /// **Timesheet Update Provider**
// class TimesheetUpdateProvider extends AutoDisposeNotifier<bool> {
//   late final TimesheetUpdateService _timesheetUpdateService;
//   late final SharedPrefServices _sharedPrefServices;

//   @override
//   bool build() {
//     _timesheetUpdateService = ref.read(timesheetUpdateServiceProvider);
//     _sharedPrefServices = ref.read(sharedPrefServicesProvider);
   
//     return false; // Initial state
//   }

//   /// **Update Timesheet API Call**
//   Future<TimeSheetUpdateModel?> updateTimesheet({
//     required BuildContext context,
//     required int timesheetId,
//     required TimeSheetUpdateModel timesheetData,
//   }) async {
//     state = true; // Start loading

//     try {
//       final token = await _sharedPrefServices.getToken();
//       if (token == null) {
//         showErrorSnackbar(
//           message: "User not authenticated or token not found.",
//           context: context,
//         );
//         return null;
//       }
//       print("gfgffggggghkvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
//       print(timesheetId);
//       final result = await _timesheetUpdateService.updateTimesheet(
//         timesheetId: timesheetId,
//         data: timesheetData,
//         token: token,
//       );

//       return result.fold(
//         (failure) {
//           showErrorSnackbar(message: failure.message, context: context);
//           return null;
//         },
//         (successData) {
//           showSuccessSnackbar(
//               message: "Timesheet updated successfully!", context: context);
//           return successData;
//         },
//       );
//     } catch (e) {
//       showErrorSnackbar(
//         message: "An error occurred: $e",
//         context: context,
//       );
//       return null;
//     } finally {
//       state = false; // Stop loading
//     }
//   }
// }





import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/show_tasks/models/timesheet_updation_model.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheetid_provider.dart'; // ✅ Import timesheetIdProvider
import 'package:time_sheet_app/features/show_tasks/services/timesheet_updation_service.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/succes_snackbar.dart';

/// ✅ **Fix: Change `AutoDisposeNotifierProvider` to `NotifierProvider`**
/// **Ensures the provider is not cleared unexpectedly**
final timesheetUpdateProvider = NotifierProvider<TimesheetUpdateProvider, bool>(
  TimesheetUpdateProvider.new,
);

/// **Timesheet Update Provider**
class TimesheetUpdateProvider extends Notifier<bool> {
  late final TimesheetUpdateService _timesheetUpdateService;
  late final SharedPrefServices _sharedPrefServices;

  @override

  bool build() {
    _timesheetUpdateService = ref.read(timesheetUpdateServiceProvider);
    _sharedPrefServices = ref.read(sharedPrefServicesProvider);
    return false; // Initial state
  }

  /// ✅ **Ensure correct `timesheetId` is always used**
  Future<TimeSheetUpdateModel?> updateTimesheet({
    required BuildContext context,
    int? timesheetId, // ✅ Make optional to fetch from provider if not passed
    required TimeSheetUpdateModel timesheetData,
  }) async {
    state = true; // Start loading

    try {
      final token = await _sharedPrefServices.getToken();
      if (token == null) {
        showErrorSnackbar(
          message: "User not authenticated or token not found.",
          context: context,
        );
        return null;
      }

      /// ✅ **Fetch `timesheetId` from provider if not passed**
      final int? storedTimesheetId = timesheetId ?? ref.watch(timesheetIdProvider);

      /// ✅ **Check if `timesheetId` is valid**
      if (storedTimesheetId == null || storedTimesheetId == 0) {
        showErrorSnackbar(
          message: "❌ Timesheet ID is missing or invalid!",
          context: context,
        );
        print("❌ ERROR: Timesheet ID is NULL or 0 before updating.");
        return null;
      }

      print("🛠️ Updating Timesheet with ID: $storedTimesheetId");
      print("🛠️ Updating Timesheet Data: ${timesheetData.toJson()}");

      final result = await _timesheetUpdateService.updateTimesheet(
        timesheetId: storedTimesheetId, // ✅ Correct ID used
        data: timesheetData,
        token: token,
      );

      return result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message, context: context);
          return null;
        },
        (successData) {
          showSuccessSnackbar(
              message: "✅ Timesheet updated successfully!", context: context);
          return successData;
        },
      );
    } catch (e) {
      showErrorSnackbar(
        message: "An error occurred: $e",
        context: context,
      );
      return null;
    } finally {
      state = false; // Stop loading
    }
  }
}
