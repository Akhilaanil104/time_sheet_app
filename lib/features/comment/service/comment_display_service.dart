import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/comment/model/comment_display_model.dart';

import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final commentDisplayServiceProvider =
    Provider((ref) => CommentDisplayServices());

class CommentDisplayServices {
  final Dio dio = Dio();
  final String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/task-comments/";

  Future<Either<Failure, List<CommentDisplayModel>>> getComments(
    {required String token, required  int taskId}) async {
    final String url = "$baseUrl$taskId/";

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        List<CommentDisplayModel> comments = (response.data as List)
            .map((comment) => CommentDisplayModel.fromJson(comment))
            .toList();

        return Right(comments);
      } else {
        return Left(Failure("Failed to fetch comments"));
      }
    } on DioException catch (e) {
      return Left(Failure(e.message ?? "An unexpected error occurred"));
    }
  }
}