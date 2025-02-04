
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/common/shared_pref_provider.dart';
// import 'package:time_sheet_app/features/home/models/status_model.dart';
// import 'package:time_sheet_app/features/home/services/satus_project_service.dart';
// import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';


// final statusProvider = NotifierProvider<StatusProvider, List<ProjectSatusModel>>(
//   () => StatusProvider(),
// );

// class StatusProvider extends Notifier<List<ProjectSatusModel>> {
//   @override
//   List<ProjectSatusModel> build() {
//     return [];
//   }

//   Future<void> fetchStatus({required BuildContext context}) async {
//     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
//     final statusProjectService = ref.read(statusProjectServiceProvider);

//     final token = await sharedPrefServices.getToken(); // Retrieve token
//     final employeeId =
//         await sharedPrefServices.getEmployeeId(); // Retrieve employee ID

//     if (token == null || employeeId == null) {
//       showErrorSnackbar(
//         message: "User not authenticated or employee ID not found.",
//         context: context,
//       );
//       return;
//     }

//     try {
//       // Fetch the status from the service
//       final result =
//           await statusProjectService.getStatusProject(token, employeeId);

//       result.fold(
//         (failure) {
//           // Handle failure case
//           showErrorSnackbar(
//             message: failure.message,
//             context: context,
//           );
//         },
//         (status) {
//           // Update state with the retrieved projects
//           state = status;
//         },
//       );
//     } catch (e) {
//       // Handle any unexpected errors
//       showErrorSnackbar(
//         message: "An unexpected error occurred: $e",
//         context: context,
//       );
//     }
//   }
// }
