import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/comment/models/comments_add_model.dart';
import 'package:time_sheet_app/features/comment/models/comments_display_model.dart';

import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final commentDisplayServiceProvider =
    Provider((ref) => CommentDisplayServices());

class CommentDisplayServices {
  final Dio dio = Dio();
  final String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/tasks/";

  Future<Either<Failure, List<CommentModel>>> getComments(
      String token, int taskId, int userId) async {
    final url = 
     "$baseUrl$taskId/comments/?user_id=$userId";
    print(url);

    // "https://api.brandexperts.ae/api/tasks/7/comments/?user_id=5"; 
    // "https://api.brandexperts.ae/api/tasks/9/comments/?user_id=3";
   print(userId);
    try {
      // Make the GET request
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      // Check if response is successful
      if (response.statusCode == 200) {
        print("show commetns");
        // Parse the list of comments
        final List<CommentModel> comments = (response.data as List)
            .map((json) => CommentModel.fromJson(json))
            .toList();
        print(comments);
        return Right(comments);
      } else {
        return Left(Failure("Failed to fetch comments"));
      }
    } on DioException catch (e) {
      // Handle Dio errors
      return Left(Failure(
        e.response?.data?['message'] ?? "An error occurred",
      ));
    } catch (e) {
      // Handle other errors
      return Left(Failure("An unknown error occurred: $e"));
    }
  }
}