import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/comment/models/comments_add_model.dart';
import 'package:time_sheet_app/features/comment/models/comments_display_model.dart';

import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final CommentServiceProvider = Provider((ref) => CommentService());

class CommentService {
  // http://127.0.0.1:8000/api/tasks/3/comments/
  final String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/tasks/";

  final Dio dio = Dio();
  Future<Either<Failure, String>> postComment(
      {required CommentModel data,
      required String token,
      required int taskId}) async {
    try {
      final url = baseUrl + taskId.toString() + "/comments/";
      print(url);
      final body = FormData.fromMap(await data.toJson());
      final response = await dio.post(url,
          data: body,
          options: Options(headers: {
            'Authorization': 'Bearer $token', // Pass the Bearer token
          }));
      if (response.statusCode == 201) {
        print("comment added successfully");
        print(response.data);
        return Right("Comment added successfully");
      } else {
        return Left(Failure("Something went wrong!"));
      }
    } on DioException catch (e) {
      return Left(Failure("Something went wrong!"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}