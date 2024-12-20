import 'package:dio/dio.dart';

class ProjectService {
  final Dio _dio = Dio();
  final String apiUrl = 'https://api.example.com/projects';

  Future<List<dynamic>> fetchProjects() async {
    const String url = 'https://api.brandexperts.ae/api/projects/';

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3MjI5Mjc5LCJpYXQiOjE3MzQ2MzcyNzksImp0aSI6ImNjMGUwNWM0ZWM1MjRiZDJhNGUwYTUzMjY5ZjJhMTBjIiwidXNlcl9pZCI6MTZ9.VwN7TjfebbaMl4j_AsMcRH4K4FnUrL_T7CYtIpFVytA',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: Check your token');
      } else {
        throw Exception(
            'Failed to load projects. Status code: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioError) {
        throw Exception(
            'Failed to load projects. Error: ${e.response?.data ?? e.message}');
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }
}
