// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:time_sheet_app/features/home/models/status_model.dart';
// import 'package:time_sheet_app/services/secrets.dart';
// import 'package:time_sheet_app/utils/const/helpers/failure.dart';


// final statusProjectServiceProvider = Provider((ref) => StatusProjectService());
// class StatusProjectService {
//   final String baseUrl =
//       "${AppSecrets.BACKEND_BASE_URL}/employee/project/stats/?employee_id=";
//   final Dio dio = Dio();

//   Future<Either<Failure, List<ProjectSatusModel>>> getStatusProject(
//       String token, int employeeId) async {
//     try {
//       // Build the request URL
//       final url = "$baseUrl$employeeId";

//       // Send GET request with authorization headers
//       final response = await dio.get(
//         url,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       // Handle success response
//       if (response.statusCode == 200 && response.data != null) {
//         print("API Response:");
//         print(response.data);

//         // Parse the response into a model
//         final statusResponse =
//             ProjectStatisticsResponse.fromJson(response.data);
//         return Right(statusResponse.data);
//       } else {
//         // Handle non-200 status codes
//         return Left(
//           Failure(
//               'Failed to fetch projects: ${response.statusCode}, Message: ${response.statusMessage ?? 'No message available'}'),
//         );
//       }
//     } on DioError catch (e) {
//       // Handle Dio-specific errors
//       return Left(
//         Failure(
//           'Dio error: ${e.response?.data ?? e.message}',
//         ),
//       );
//     } catch (e) {
//       // Handle any other exceptions
//       return Left(
//         Failure(
//           'Unexpected error: $e',
//         ),
//       );
//     }
//   }
// }
