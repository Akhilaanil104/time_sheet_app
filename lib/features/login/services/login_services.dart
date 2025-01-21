import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/login/model/suceessful_login_model.dart';
import 'package:time_sheet_app/features/login/model/user_login_model.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

import 'package:time_sheet_app/services/secrets.dart';

final loginServiceProvider = Provider((ref) => LoginServices());

class LoginServices {
  final String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/login/";

  final Dio dio = Dio();

  Future<Either<Failure, SuceessfulLoginModel>> loginUser(
      {required UserLoginModel data}) async {
    try {
      print(baseUrl);
      final body = FormData.fromMap(data.toJson());
      final response = await dio.post(baseUrl, data: body);
      print("hi");

      print(response.data);

      if (response.statusCode == 200) {
        print("home");
        return Right(SuceessfulLoginModel.fromJson(response.data));
      } else {
        print("got error");
        return Left(Failure("Something went wrong!"));
      }
    } on DioException catch (e) {
      // Handle Dio exceptions with meaningful messages
      final errorDetail =
          e.response?.data != null && e.response?.data['detail'] != null
              ? e.response?.data['detail']
              : "Invalid username or password.";
      return Left(Failure(errorDetail));
    } catch (e) {
      // Handle unexpected errors
      return Left(Failure("Something went wrong!"));
    }
  }
}
