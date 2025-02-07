// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // // // import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
// // // // import 'package:time_sheet_app/features/Project_details/service/Project_task_service.dart';
// // // // import 'package:time_sheet_app/features/home/services/user_project_service.dart';

// // // // class TaskUserProvieder extends Notifier<List<TaskModel>>{
// // // //   List<TaskModel> build(){
// // // //     return [];
// // // //   }
// // // //   Future<void>fetchTask({required BuildContext context})async{
// // // //     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
// // // //     final usertaskService = ref.read(projectTaskServiceProvider);
// // // //    final token = await sharedPrefServices.getToken(); // Retrieve token
// // // //     final employeeId =
// // // //         await sharedPrefServices.getEmployeeId(); // Retrieve employee ID
// // // //     final projectId =

// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // // import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
// // // import 'package:time_sheet_app/features/Project_details/service/Project_task_service.dart';

// // // class TaskUserProvider extends Notifier<List<TaskModel>> {
// // //   List<TaskModel> build() {
// // //     return [];
// // //   }

// // //   Future<void> fetchTask({
// // //     required BuildContext context,
// // //     required int projectId, // Pass projectId as a parameter
// // //   }) async {
// // //     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
// // //     final userTaskService = ref.read(projectTaskServiceProvider);

// // //     final token = await sharedPrefServices.getToken(); // Retrieve token
// // //     final employeeId =
// // //         await sharedPrefServices.getEmployeeId(); // Retrieve employee ID

// // //     try {
// // //       // Fetch tasks from the service
// // //       final result =
// // //           await userTaskService.getTask(token!, projectId, employeeId!);

// // //       result.fold(
// // //         (failure) {
// // //           // Handle failure
// // //           print("Error fetching tasks: ${failure.message}");
// // //         },
// // //         (tasks) {
// // //           // Update state with the fetched tasks
// // //           state = tasks;
// // //         },
// // //       );
// // //     } catch (error) {
// // //       // Handle unexpected errors
// // //       print("Unexpected error: $error");
// // //     }
// // //   }
// // // }

// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:time_sheet_app/common/shared_pref_provider.dart';
// // import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
// // import 'package:time_sheet_app/features/Project_details/service/Project_task_service.dart';
// // import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';

// // // Provider to fetch tasks dynamically based on projectId
// // final taskProvider = FutureProvider<List<TaskModel>>((ref) async {
// //   final taskService = ref.read(projectTaskServiceProvider);

// //   // Fetch dynamic values from shared preferences or providers
// //   final token = await ref.read(sharedPrefServicesProvider).getToken();
// //   final projectId = ref.read(selectedProjectIdProvider);
// //   final employeeId = await ref.read(sharedPrefServicesProvider).getEmployeeId();

// //   // Validate inputs
// //   if (token == null || projectId == null || employeeId == null) {
// //     throw Exception(
// //         'Invalid parameters: token, projectId, or employeeId is null');
// //   }

// //   final result = await taskService.getTask(token, projectId, employeeId);
// //   return result.fold((failure) => [], (tasks) => tasks);
// // });

// // // Provider to manage the expanded state for tasks
// // final expandedTaskProvider = StateProvider<List<bool>>((ref) => []);

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/common/shared_pref_provider.dart';
// import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
// import 'package:time_sheet_app/features/Project_details/service/Project_task_service.dart';
// import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
// import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

// final taskUserProvider = NotifierProvider<TaskUserProvider, List<TaskModel>>(
//     () => TaskUserProvider());

// class TaskUserProvider extends Notifier<List<TaskModel>> {
//   @override
//   List<TaskModel> build() {
//     return [];
//   }

//   Future<void> fetchTask({required BuildContext context}) async {
//     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
//     final userTaskService = ref.read(projectTaskServiceProvider);

//     // Fetch the selected project ID from the provider
//     final projectId = ref.read(selectedProjectIdProvider);
    
//     // final projecTitle = ref.read(selectProjectTitleProvider);
//     print("thi is is ");
//     // print(projecTitle);
//     print(projectId);
//     print("thi is is ");
//     //  int  projectId = 1;
    

//     final token = await sharedPrefServices.getToken(); // Retrieve token
//     final employeeId =
//         await sharedPrefServices.getEmployeeId(); // Retrieve employee ID
// // projectId
// print(employeeId);
// print(token);
//     if (token == null || employeeId == null || projectId == null) {
//       showErrorSnackbar(
//         message:
//             "User not authenticated or employee ID not found or NoTask found.",
//         context: context,
//       );
//       return;
//     }
//     try {
//       // Fetch tasks for the selected project
//       final result =
//           await userTaskService.getTasks(token, projectId, employeeId);

//       result.fold(
//         (failure) {
//           // Handle failure
//           showErrorSnackbar(message: failure.message, context: context);
//         },
//         (tasks) {
//           // Update state with the fetched tasks
//           state = tasks;
//         },
//       );
//     } catch (error) {
//       // Handle unexpected errors
//       showErrorSnackbar(
//         message: "An unexpected error occurred: $e",
//         context: context,
//       );
//     }
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
import 'package:time_sheet_app/features/Project_details/service/Project_task_service.dart';
import 'package:time_sheet_app/features/home/provider/selected_project_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final taskUserProvider = NotifierProvider<TaskUserProvider, TaskResponse?>(
    () => TaskUserProvider());

class TaskUserProvider extends Notifier<TaskResponse?> {
  @override
  TaskResponse? build() {
    return null; // Initial state is null (no data loaded)
  }

  Future<void> fetchTask({required BuildContext context}) async {
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final userTaskService = ref.read(projectTaskServiceProvider);

    final projectId = ref.read(selectedProjectIdProvider);
    final token = await sharedPrefServices.getToken(); // Retrieve token
    final employeeId = await sharedPrefServices.getEmployeeId(); // Retrieve employee ID

    if (token == null || employeeId == null || projectId == null) {
      showErrorSnackbar(
        message: "User not authenticated or missing required information.",
        context: context,
      );
      return;
    }

    try {
      final result =
          await userTaskService.getTasks(token, projectId, employeeId);

      result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message, context: context);
        },
        (taskResponse) {
          state = taskResponse; // Updated to store entire TaskResponse object
        },
      );
    } catch (error) {
      showErrorSnackbar(
        message: "An unexpected error occurred: $error",
        context: context,
      );
    }
  }
}
