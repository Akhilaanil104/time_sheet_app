import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/register/models/successful_registration_model.dart';
import 'package:time_sheet_app/features/register/models/user_registration_model.dart';
import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final registerServiceProvider = Provider((ref) => RegisterService());

class RegisterService {
  final String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/register/";
  final Dio dio = Dio();
  Future<Either<Failure, SuccessfulRegistrationModel>> userRegister(
      {required UserRegistrationModel data}) async {
    try {
      final body = FormData.fromMap(await data.toJson());
      final response = await dio.post(baseUrl, data: body);
      if (response.statusCode == 201) {
        return Right(SuccessfulRegistrationModel.fromJson(response.data));
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
