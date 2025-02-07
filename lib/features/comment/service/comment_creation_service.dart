import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/comment/model/comment_creation_model.dart';
import 'package:time_sheet_app/features/comment/model/comment_response_creation_model.dart';
import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final commentCreationServiceProvider = Provider((ref)=> CommentCreationService());

class CommentCreationService {
  final String baseUrl = "https://api.brandexperts.ae/api/task-comments/create/";
  // "${AppSecrets.BACKEND_BASE_URL}/task-comments/create/";

  final Dio dio = Dio();
 
Future<Either<Failure, ResponseCommentCreationModel>> createComment(
      {required CommentCreationModel data, required String token}) async {
    try {
      final body = FormData.fromMap(data.toJson());

      final response = await dio.post(
        baseUrl,
        data: body,
        options: Options(
          headers: {
            "Authorization": "Bearer $token", // <-- Add Token Here
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 201) {
        return Right(ResponseCommentCreationModel.fromJson(response.data));
      } else {
        return Left(Failure("Something went wrong!"));
      }
    } on DioException catch (e) {
      final errorDetail = e.response?.data?['detail'] ?? "Invalid credentials.";
      return Left(Failure(errorDetail));
    } catch (e) {
      return Left(Failure("Something went wrong!"));
    }
  }

  }

