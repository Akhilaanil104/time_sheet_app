// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final sharedPrefServicesProvider = Provider((ref) => SharedPrefServices());

// class SharedPrefServices {
//   final String _tokenKey = 'auth_token';

//   // Save token to SharedPreferences
//   Future<void> saveToken({required String token}) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_tokenKey, token);
//   }

//   // Retrieve token from SharedPreferences
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_tokenKey);
//   }

//   // Delete token from SharedPreferences
//   Future<void> deleteToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_tokenKey);
//   }

//   Future<bool> isUserLoggedIn() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.containsKey(_tokenKey);
//   }
// }


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefServicesProvider = Provider((ref) => SharedPrefServices());

class SharedPrefServices {
  final String _tokenKey = 'auth_token';
  final String _employeeIdKey = 'employee_id';

  // Save token to SharedPreferences
  Future<void> saveToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Save employee ID to SharedPreferences
  Future<void> saveEmployeeId({required int employeeId}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_employeeIdKey, employeeId);
  }

  // Retrieve token from SharedPreferences
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Retrieve employee ID from SharedPreferences
  Future<int?> getEmployeeId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_employeeIdKey);
  }

  // Delete token from SharedPreferences
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  // Delete employee ID from SharedPreferences
  Future<void> deleteEmployeeId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_employeeIdKey);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey);
  }
}
