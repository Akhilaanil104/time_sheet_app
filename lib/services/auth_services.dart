import 'package:dio/dio.dart';

import 'package:time_sheet_app/model/login_model.dart';
import 'package:time_sheet_app/model/registration_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> registerUser(RegistrationModel model) async {
    const String apiUrl = "https://api.brandexperts.ae/api/register/";

    try {
      final response = await _dio.post(
        apiUrl,
        data: model.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 201) {
        print("Registration Successful: ${response.data}");
        return response;
      } else {
        print("Registration Failed: ${response.data}");
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        print("Error during registration: ${e.response?.data}");
        print("Status Code: ${e.response?.statusCode}");
        print("Message: ${e.message}");
        return e.response; // Returning the error response
      } else {
        print("Unexpected error: $e");
        return null;
      }
    }
  }
  Future<Response?> loginUser(LoginModel model) async {
    const String apiUrl = "https://api.brandexperts.ae/api/login/";

    try {
      final response = await _dio.post(
        apiUrl,
        data: model.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print("Login Successful: ${response.data}");
        return response;
      } else {
        print("Login Failed: ${response.data}");
        return null;
      }
    } catch (e) {
      if (e is DioError) {
        print("Error during login: ${e.response?.data}");
        print("Status Code: ${e.response?.statusCode}");
        print("Message: ${e.message}");
        return e.response;
      } else {
        print("Unexpected error: $e");
        return null;
      }
    }
  }

}