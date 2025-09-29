import 'dart:convert';

import 'package:appscrip_users/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";
  static const Duration timeOutDuration = Duration(seconds: 10);

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl/users"))
          .timeout(timeOutDuration);

      if (response.body == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else if (response.statusCode == 404) {
        throw Exception('Resource not found (404)');
      } else if (response.statusCode == 500) {
        throw Exception('Internal server error (500)');
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } on http.ClientException {
      throw Exception('Network error. Please check your internet connection.');
    } catch (e) {
      if (e.toString().contains('TimeoutException')) {
        throw Exception('Request timed out. Please try again later.');
      }
      rethrow;
    }
  }
}
