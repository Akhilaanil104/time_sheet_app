import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:time_sheet_app/features/show_tasks/models/timesheet_updation_model.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheetid_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final timesheetUpdateServiceProvider = Provider((ref) => TimesheetUpdateService());

class TimesheetUpdateService {
  final Dio dio = Dio();

  // Future<Either<Failure, TimeSheetUpdateModel>> updateTimesheet({
  //   required int timesheetId,
  //   required TimeSheetUpdateModel data,
  //   required String token,
  // }) async {
  //   try {
  //     final String url = "https://api.brandexperts.ae/api/timesheets/edit/$timesheetId/";

  //     final response = await dio.put(
  //       url,
  //       data: data.toJson(),
  //       options: Options(headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //       }),
  //     );

  //     if (response.statusCode == 200 && response.data != null) {
  //       if (response.data['data'] == null) {
  //         return Left(Failure("No data found in response."));
  //       }

  //       final updatedTimesheet = TimeSheetUpdateModel.fromJson(response.data['data']);
  //       return Right(updatedTimesheet);
  //     } else {
  //       return Left(Failure("Failed to update timesheet. Error: ${response.statusCode}"));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.statusCode == 400) {
  //         return Left(Failure("Invalid request data."));
  //       } else if (e.response?.statusCode == 401) {
  //         return Left(Failure("Unauthorized request. Please log in again."));
  //       }
  //       return Left(Failure(e.response?.data['message'] ?? "Unexpected error occurred."));
  //     } else {
  //       return Left(Failure("Failed to connect to the server. Please try again."));
  //     }
  //   } catch (e) {
  //     return Left(Failure("An unexpected error occurred: $e"));
  //   }
  // }
//   Future<Either<Failure, TimeSheetUpdateModel>> updateTimesheet({
//   required int timesheetId,
//   required TimeSheetUpdateModel data,
//   required String token,
// }) async {
//   try {

//       // final int? taskId = ref.watch(timesheetIdProvider);
//     final String url ="https://api.brandexperts.ae/api/timesheets/edit/$timesheetId/";
//     //  "https://api.brandexperts.ae/api/timesheets/edit/$timesheetId/";
//     //  print(timesheetId);
//      print("bbbnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnghghk  ");
//      print(url);

//     print("🔹 Sending PUT request to: $url");
//     print("📝 Request Body: ${data.toJson()}");
//     print("🔑 Auth Token: $token");

//     final response = await dio.put(
//       url,
//       data: data.toJson(),
//       options: Options(headers: {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       }),
//     );

//     print("✅ Response Status: ${response.statusCode}");
//     print("✅ Response Data: ${response.data}");

//     if (response.statusCode == 200 && response.data != null) {
//       print("hiii im here i love u");
//       if (response.data['data'] == null) {
//         print("❌ API Response data['data'] is NULL");
//         return Left(Failure("API response did not contain timesheet data."));
//       }

//       final updatedTimesheet = TimeSheetUpdateModel.fromJson(response.data['data']);
//       print("✅ Timesheet Successfully Updated: ${updatedTimesheet.toJson()}");
//       return Right(updatedTimesheet);
//     } else {
//       print("❌ Failed to update timesheet. Status: ${response.statusCode}");
//       return Left(Failure("Failed to update timesheet. Error: ${response.statusCode}"));
//     }
//   } on DioException catch (e) {
//     print("❌ API Error: ${e.response?.data}");
//     return Left(Failure(e.response?.data['message'] ?? "Something went wrong!"));
//   } catch (e) {
//     print("❌ Unknown Error: $e");
//     return Left(Failure(e.toString()));
//   }
// }





Future<Either<Failure, TimeSheetUpdateModel>> updateTimesheet({
  required int timesheetId,
  required TimeSheetUpdateModel data,
  required String token,
}) async {
  try {
    // ✅ Debugging: Print Timesheet ID before sending request
    print("📌 Debug: Timesheet ID Passed to updateTimesheet(): $timesheetId");

    if (timesheetId == 0) {
      print("❌ ERROR: Invalid Timesheet ID (0) detected before sending API request!");
      return Left(Failure("Invalid Timesheet ID: 0"));
    }

    final String url = "https://api.brandexperts.ae/api/timesheets/edit/$timesheetId/";
    print("🔹 Sending PUT request to: $url");
    print("📝 Request Body: ${data.toJson()}");
    print("🔑 Auth Token: $token");

    final response = await dio.put(
      url,
      data: data.toJson(),
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }),
    );

    print("✅ Response Status: ${response.statusCode}");
    print("✅ Response Data: ${response.data}");

    if (response.statusCode == 200 && response.data != null) {
      if (response.data['data'] == null) {
        print("❌ API Response data['data'] is NULL");
        return Left(Failure("API response did not contain timesheet data."));
      }

      final updatedTimesheet = TimeSheetUpdateModel.fromJson(response.data['data']);
      print("✅ Timesheet Successfully Updated: ${updatedTimesheet.toJson()}");
      return Right(updatedTimesheet);
    } else {
      print("❌ Failed to update timesheet. Status: ${response.statusCode}");
      return Left(Failure("Failed to update timesheet. Error: ${response.statusCode}"));
    }
  } on DioException catch (e) {
    print("❌ API Error: ${e.response?.data}");
    return Left(Failure(e.response?.data['message'] ?? "Something went wrong!"));
  } catch (e) {
    print("❌ Unknown Error: $e");
    return Left(Failure(e.toString()));
  }
}

}
