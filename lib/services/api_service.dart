import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apna_gadi/models/vehicals.dart';
import '../utils/constants.dart';

class ApiService {
  final String baseUrl = Constants.baseUrl;

  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login.php');

    final requestBody = jsonEncode({
      'username': username,
      'password': password,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return {
          'success': responseData['success'] == true,
          'admin': responseData['admin'] == true,
          'message': responseData['message'] ?? 'Login successful'
        };
      } else {
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error details: $e');
      if (e is http.ClientException) {
        throw Exception('Network issue: ${e.message}');
      } else if (e is TimeoutException) {
        throw Exception('Request timed out');
      } else {
        throw Exception('Failed to login: $e');
      }
    }
  }

  Future<bool> register(
      String username, String password, String confirmPassword) async {
    final url = Uri.parse('$baseUrl/register.php');

    final requestBody = jsonEncode({
      'username': username,
      'password': password,
      'confirm_password': confirmPassword,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['success'] == true;
      } else {
        throw Exception(
            'Failed to register. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error details: $e');
      throw Exception('Failed to register: $e');
    }
  }

  Future<List<Vehicle>> fetchFeaturedVehicles() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/featured-vehicles.php'),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Vehicle.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load featured vehicles');
      }
    } catch (e) {
      print('Error details: $e');
      if (e is http.ClientException) {
        throw Exception('Network issue');
      }
      throw Exception('Failed to load featured vehicles: $e');
    }
  }

  Future<List<Vehicle>> fetchVehiclesByName(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search-vehicles.php?query=$query'),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Vehicle.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load vehicles by name');
      }
    } catch (e) {
      print('Error details: $e');
      if (e is http.ClientException) {
        throw Exception('Network issue');
      }
      throw Exception('Failed to load vehicles by name: $e');
    }
  }

  Future<List<Vehicle>> fetchVehiclesByCategory(String category) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/category-vehicles.php?category=$category'),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Vehicle.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load vehicles by category');
      }
    } catch (e) {
      print('Error details: $e');
      if (e is http.ClientException) {
        throw Exception('Network issue');
      }
      throw Exception('Failed to load vehicles by category: $e');
    }
  }
}
