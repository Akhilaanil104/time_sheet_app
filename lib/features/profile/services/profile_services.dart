
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/profile/model/profile_model.dart';
import 'package:time_sheet_app/services/secrets.dart';
import 'package:time_sheet_app/utils/const/helpers/failure.dart';

final userProfileServicesProvider = Provider((ref) => UserProfileService());

class UserProfileService {
  final String baseUrl = "${AppSecrets.BACKEND_BASE_URL}/profile/";
  final Dio dio = Dio();

  /// Fetch User Profile from API
 Future<Either<Failure, List<ProfileModel>>> getUserProfile(String token, int employeeId) async {
  try {
    final response = await dio.get(
      "$baseUrl$employeeId/",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    print("🛠 RAW API RESPONSE: ${response.data}"); // ✅ Debugging API response

    if (response.statusCode == 200 && response.data != null) {
      final profileResponse = ProfileResponse.fromJson(response.data);
      print("✅ Parsed API Data: ${profileResponse.data}"); // ✅ Check parsed data
      return Right(profileResponse.data);
    } else {
      print("⚠️ API returned an error: ${response.statusCode}");
      return Left(Failure('Failed to fetch profile: ${response.statusCode}'));
    }
  } on DioException catch (e) {
    print("❌ DioException: ${e.response?.data ?? e.message}");
    return Left(Failure('Dio error: ${e.response?.data ?? e.message}'));
  } catch (e) {
    print("❌ Unexpected Error: $e");
    return Left(Failure('Unexpected error: $e'));
  }
}


}
