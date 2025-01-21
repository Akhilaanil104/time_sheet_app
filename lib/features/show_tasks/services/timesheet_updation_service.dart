import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/show_tasks/models/time_sheet_update_model.dart';
import 'package:time_sheet_app/features/show_tasks/models/timesheet_updation_response_model.dart';

import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final timesheetUpdationServiceProvider =
    Provider((ref) => TimesheetUpdationService());

class TimesheetUpdationService {
  final String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/timesheet/edit/";

  final Dio dio = Dio();
  Future<Either<Failure, TimesheetUpdateResponseModel>> updateTimesheet(
      {required TimesheetUpdateModel data,
      required String token,
      required int id}) async {
    try {
      print("hiii");
      final url = baseUrl + id.toString() + "/";
      final body = FormData.fromMap(await data.toJson());
      final response = await dio.put(url,
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200) {
        print("kitti");
        print(response.data);
        return Right(TimesheetUpdateResponseModel.fromJson(response.data));
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
