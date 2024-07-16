import 'dart:async';

import 'package:apna_gadi/models/vehicals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';

class ApiService {
  final String baseUrl = Constants.baseUrl;

  Future<bool> login(String username, String password) async {
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

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['success'] == true;
      } else {
        throw Exception('Failed to login. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Print detailed error message to help debug
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

  Future<List<Vehicle>> fetchFeaturedVehicles() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/featured-vehicles.php'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Vehicle.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load featured vehicles');
      }
    } catch (e) {
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

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Vehicle.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load vehicles by name');
      }
    } catch (e) {
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

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Vehicle.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load vehicles by category');
      }
    } catch (e) {
      if (e is http.ClientException) {
        throw Exception('Network issue');
      }
      throw Exception('Failed to load vehicles by category: $e');
    }
  }
}
