
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:time_sheet_app/features/home/models/project_model.dart';
import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final userProjectServicesProvider = Provider((ref) => UserProjectService());

class UserProjectService {
  final String baseUrl =
      "${AppSecrets.BACKEND_BASE_URL}/projects/filter-by-employee/";
  final Dio dio = Dio();

  Future<Either<Failure, List<ProjectModel>>> getUserProject(
      String token, int employeeId) async {
    try {
      final response = await dio.get(
        "$baseUrl$employeeId/", // Append employee ID to the URL if needed
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Pass the Bearer token
          },
        ),
      );

      if (response.statusCode == 200) {
        print("API Response:");
        print(response.data);

        // Parse the response as ProjectResponse
        final projectResponse = ProjectResponse.fromJson(response.data);
          print(projectResponse.data);

        // Return the list of projects from the response
        return Right(projectResponse.data);
      } else {
        // Return a Failure for non-200 status codes
        return Left(
            Failure('Failed to fetch projects: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      // Handle Dio errors
      return Left(Failure('Dio error: ${e.response?.data ?? e.message}'));
    } catch (e) {
      // Handle other errors
      return Left(Failure('Unexpected error: $e'));
    }
  }

}
