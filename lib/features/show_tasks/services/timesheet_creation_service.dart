
// // // // // import 'package:dartz/dartz.dart';
// // // // // import 'package:dio/dio.dart';
// // // // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // // // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // // // // import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
// // // // // import 'package:time_sheet_app/services/secrets.dart';
// // // // // import 'package:time_sheet_app/utils/const/helpers/failure.dart';

// // // // // final timesheetServiceProvider = Provider((ref)=> TimesheetCreationService());
// // // // // class TimesheetCreationService {
// // // // //   final  String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/timesheet/create/";
// // // // //   final Dio dio = Dio();
// // // // //   Future<Either<Failure,TimeSheetResponseModel>>postTimesheet({required TimeSheetModel data, required String token })async{
// // // // //     try{
// // // // //       final  body = FormData.fromMap(await data.toJson());
// // // // //       final response = await dio.post(baseUrl,data: body,options: Options(headers: {
// // // // //         'Authorization': 'Bearer $token', // Pass the Bearer token
// // // // //       }));
// // // // //       if (response.statusCode == 201) {
// // // // //         return Right(TimeSheetResponseModel.fromJson(response.data));
// // // // //     }
// // // // //     else {
// // // // //         return Left(Failure("Something went wrong!"));
// // // // //       }
// // // // //     } on DioException catch (e) {
// // // // //       return Left(Failure("Something went wrong!"));
// // // // //     } catch (e) {
// // // // //       return Left(Failure(e.toString()));
// // // // //     }
// // // // //   }
// // // // // }





// // // // import 'package:dartz/dartz.dart';
// // // // import 'package:dio/dio.dart';
// // // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // // // import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
// // // // import 'package:time_sheet_app/utils/const/helpers/failure.dart';

// // // // final timesheetServiceProvider = Provider((ref) => TimesheetCreationService());

// // // // class TimesheetCreationService {
// // // //   final String baseUrl = "https://api.brandexperts.ae/api/timesheets/create/";
// // // //   final Dio dio = Dio();

// // // //   Future<Either<Failure, TimeSheetResponseModel>> postTimesheet({
// // // //     required TimeSheetModel data,
// // // //     required String token,
// // // //   }) async {
// // // //     try {
// // // //       final body = data.toJson(); // Convert model to JSON format

// // // //       final response = await dio.post(
// // // //         baseUrl,
// // // //         data: body,
// // // //         options: Options(headers: {
// // // //           'Authorization': 'Bearer $token', // Pass the Bearer token
// // // //           'Content-Type': 'application/json', // Ensure JSON format
// // // //         }),
// // // //       );

// // // //       if (response.statusCode == 201 || response.statusCode == 200) {
// // // //         return Right(TimeSheetResponseModel.fromJson(response.data));
// // // //       } else {
// // // //         return Left(Failure("Something went wrong! Server responded with: ${response.statusCode}"));
// // // //       }
// // // //     } on DioException catch (e) {
// // // //       return Left(Failure(e.response?.data['message'] ?? "Something went wrong!"));
// // // //     } catch (e) {
// // // //       return Left(Failure(e.toString()));
// // // //     }
// // // //   }
// // // // }






// // // import 'package:dartz/dartz.dart';
// // // import 'package:dio/dio.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // // import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
// // // import 'package:time_sheet_app/utils/const/helpers/failure.dart';

// // // final timesheetServiceProvider = Provider((ref) => TimesheetCreationService());

// // // class TimesheetCreationService {
// // //   final String baseUrl = "https://api.brandexperts.ae/api/timesheets/create/";
// // //   final Dio dio = Dio();

// // //   Future<Either<Failure, TimeSheetResponseModel>> postTimesheet({
// // //     required TimeSheetModel data,
// // //     required String token,
// // //   }) async {
// // //     try {
// // //       final body = data.toJson(); // Convert model to JSON format

// // //       final response = await dio.post(
// // //         baseUrl,
// // //         data: body,
// // //         options: Options(headers: {
// // //           'Authorization': 'Bearer $token', // Pass the Bearer token
// // //           'Content-Type': 'application/json', // Ensure JSON format
// // //         }),
// // //       );

// // //       if (response.statusCode == 201 || response.statusCode == 200) {
// // //         return Right(TimeSheetResponseModel.fromJson(response.data));
// // //       } else {
// // //         return Left(Failure("Something went wrong! Server responded with: ${response.statusCode}"));
// // //       }
// // //     } on DioException catch (e) {
// // //       return Left(Failure(e.response?.data['message'] ?? "Something went wrong!"));
// // //     } catch (e) {
// // //       return Left(Failure(e.toString()));
// // //     }
// // //   }
// // // }



// // import 'package:dartz/dartz.dart';
// // import 'package:dio/dio.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// // import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
// // import 'package:time_sheet_app/features/show_tasks/providers/task_id_provider.dart';
// // import 'package:time_sheet_app/utils/const/helpers/failure.dart';

// // final timesheetServiceProvider = Provider((ref) => TimesheetCreationService());

// // class TimesheetCreationService {
// //   final String baseUrl = "https://api.brandexperts.ae/api/timesheets/create/";
// //   final Dio dio = Dio();

// //   Future<Either<Failure, TimeSheetResponseModel>> postTimesheet({
// //     required TimeSheetModel data,
// //     required String token,
// //   }) async {
// //     try {
// //       final body = data.toJson(); // Convert model to JSON format

// //       final response = await dio.post(
// //         baseUrl,
// //         data: body,
// //         options: Options(headers: {
// //           'Authorization': 'Bearer $token', // Pass the Bearer token
// //           'Content-Type': 'application/json', // Ensure JSON format
// //         }),
// //       );

// //       if (response.statusCode == 201 || response.statusCode == 200) {
// //         print("dii patty");
// //         final id= response.data['data']['id'];
// //           ref.read(timesheetIdProvider.notifier).state = id;
// //         print(id);
// //         print(response.data[id]);
// //         return Right(TimeSheetResponseModel.fromJson(response.data));
// //       } else {
// //         return Left(Failure("Something went wrong! Server responded with: ${response.statusCode}"));
// //       }
// //     } on DioException catch (e) {
// //       return Left(Failure(e.response?.data['message'] ?? "Something went wrong!"));
// //     } catch (e) {
// //       return Left(Failure(e.toString()));
// //     }
// //   }
// // }



// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
// import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
// import 'package:time_sheet_app/features/show_tasks/providers/task_id_provider.dart';
// import 'package:time_sheet_app/utils/const/helpers/failure.dart';

// final timesheetServiceProvider = Provider((ref) => TimesheetCreationService());

// class TimesheetCreationService {
//   final A = ref.read(timesheetIdProvider.notifier).state;
//   final String baseUrl = "https://api.brandexperts.ae/api/timesheets/create/";
//   final Dio dio = Dio();

//   Future<Either<Failure, TimeSheetResponseModel>> postTimesheet({
//     required TimeSheetModel data,
//     required String token,
//   }) async {
//     try {
//       final body = data.toJson(); // Convert model to JSON format

//       final response = await dio.post(
//         baseUrl,
//         data: body,
//         options: Options(headers: {
//           'Authorization': 'Bearer $token', // Pass the Bearer token
//           'Content-Type': 'application/json', // Ensure JSON format
//         }),
//       );

//       print("🔹 Full Response: ${response.data}");

//       if (response.statusCode == 201 || response.statusCode == 200) {
//             final int? id = response.data['data']?['id']; // Extracting ID
//       .state = id; // Storing ID in provider
//         print("✅ Timesheet Created Successfully!");

//         // Extract ID correctly
//         // final int? id = response.data['data']?['id'];
//         // print("✅ Extracted Task ID: $id");
        
         

//         if (id == null) {
//           return Left(Failure("❌ Task ID is null in the API response!"));
//         }
                
//         return Right(TimeSheetResponseModel.fromJson(response.data));
//       } else {
//         return Left(Failure("Something went wrong! Server responded with: ${response.statusCode}"));
//       }
//     } on DioException catch (e) {
//       print("❌ Dio Error: ${e.response?.data}");
//       return Left(Failure(e.response?.data?['message'] ?? "Something went wrong!"));
//     } catch (e) {
//       print("❌ Unknown Error: $e");
//       return Left(Failure(e.toString()));
//     }
//   }
// }




import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
import 'package:time_sheet_app/features/show_tasks/providers/timesheetid_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

/// **Timesheet Creation Service Provider**
final timesheetServiceProvider = Provider((ref) => TimesheetCreationService());

class TimesheetCreationService {
  final String baseUrl = "https://api.brandexperts.ae/api/timesheets/create/";
  final Dio dio = Dio();

  /// **Method to post a timesheet**
  Future<Either<Failure, ResponseTimeSheetData>> postTimesheet({
    required TimeSheetModel data,
    required String token,
 
  }) async {
    try {
      final body = data.toJson(); // Convert model to JSON format

      final response = await dio.post(
        baseUrl,
        data: body,
        options: Options(headers: {
          'Authorization': 'Bearer $token', // Pass the Bearer token
          'Content-Type': 'application/json', // Ensure JSON format
        }),
      );

      print("🔹 Full Response: ${response.data}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        final int? id = response.data['data']?['id']; // Extracting ID

        if (id == null) {
          return Left(Failure("❌ Task ID is null in the API response!"));
        }

        // ✅ **Store ID in the Provider**
        // ref.read(timesheetIdProvider.notifier).state = id;
        print("✅ Timesheet Created Successfully! ID: $id");

        return Right(ResponseTimeSheetData.fromJson(response.data));
      } else {
        return Left(Failure("Something went wrong! Server responded with: ${response.statusCode}"));
      }
    } on DioException catch (e) {
      print("❌ Dio Error: ${e.response?.data}");
      return Left(Failure(e.response?.data?['message'] ?? "Something went wrong!"));
    } catch (e) {
      print("❌ Unknown Error: $e");
      return Left(Failure(e.toString()));
    }
  }
}
