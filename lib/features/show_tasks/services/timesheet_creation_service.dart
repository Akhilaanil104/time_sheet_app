
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_creation_model.dart';
import 'package:time_sheet_app/features/show_tasks/models/timesheet_response_model.dart';
import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final timesheetServiceProvider = Provider((ref)=> TimesheetCreationService());
class TimesheetCreationService {
  final  String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/timesheet/create/";
  final Dio dio = Dio();
  Future<Either<Failure,TimeSheetResponseModel>>postTimesheet({required TimeSheetModel data, required String token })async{
    try{
      final  body = FormData.fromMap(await data.toJson());
      final response = await dio.post(baseUrl,data: body,options: Options(headers: {
        'Authorization': 'Bearer $token', // Pass the Bearer token
      }));
      if (response.statusCode == 201) {
        return Right(TimeSheetResponseModel.fromJson(response.data));
    }
    else {
        return Left(Failure("Something went wrong!"));
      }
    } on DioException catch (e) {
      return Left(Failure("Something went wrong!"));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
