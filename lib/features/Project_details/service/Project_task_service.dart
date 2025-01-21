// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
// import 'package:time_sheet_app/services/secrets.dart';
// import 'package:time_sheet_app/utils/const/helpers/failure.dart';

// final projectTaskServiceProvider = Provider((ref) => ProjectTaskService());

// class ProjectTaskService {
//   // https://api.brandexperts.ae/api/tasks/filter-by-project-and-employee/1/7/
//   final String baseUrl =
//       "${AppSecrets.BACKEND_BASE_URL}/projects/filter-by-project-and-employee/";
//   final Dio dio = Dio();
//   Future<Either<Failure, List<TaskModel>>> getTask(

//       String token, int projectId, int employeeId) async {
//     print('get task');
//     try {
//       final response = await dio.get(" https://api.brandexperts.ae/api/tasks/filter-by-project-and-employee/1/3/",
//         // "$baseUrl$projectId/$employeeId/",
//           options: Options(headers: {
//             'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM5NzY5MTQzLCJpYXQiOjE3MzcxNzcxNDMsImp0aSI6ImE5NzQ4NDFhNzZhYzQ0ZTM5MGZlOTZiZDM2NWI3YjEwIiwidXNlcl9pZCI6Nn0.mC-DThEB98FvLGGux2t7T--HB-lwjpGIYnJPQDT57Dg'
//             // $token', // Pass the Bearer token
//           }));

//       print("hi");
//       if (response.statusCode == 200) {
//         print("task kittti");
//           // print(response.data);
//         final taskResponse = TaskResponse.fromJson(response.data);
//         print(taskResponse);
//         return Right(taskResponse.data);
//       } else {
//         // Return a Farilure for non-200 status codes
//         return Left(
//             Failure('Failed to fetch Tasks: ${response.statusCode}'));
//       }
//     } on DioException catch (e) {
//       // Handle Dio errors
//       return Left(Failure('Dio error: ${e.response?.data ?? e.message}'));
//     } catch (e) {
//       // Handle other errors
//       return Left(Failure('Unexpected error: $e'));
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/Project_details/model/project_task_model.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final projectTaskServiceProvider = Provider((ref) => ProjectTaskService());

class ProjectTaskService {
  final Dio dio = Dio();

  Future<Either<Failure, List<TaskModel>>> getTask(
      String token, int projectId, int employeeId) async {
    // projectId = 1;
    final String url =
        "https://api.brandexperts.ae/api/tasks/filter-by-project-and-employee/$projectId/$employeeId/";
    try {
      // Send GET request with headers
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Pass the Bearer token
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        // Parse the response into TaskResponse
        final taskResponse = TaskResponse.fromJson(response.data);
        print(taskResponse.data);
        return Right(taskResponse.data);
      } else {
        // Handle non-200 status codes
        return Left(Failure('Failed to fetch tasks: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      return Left(Failure('Dio error: ${e.response?.data ?? e.message}'));
    } catch (e) {
      // Handle other exceptions
      return Left(Failure('Unexpected error: $e'));
    }
  }
}
