import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:meal_menu/model/cataregorymodel.dart';

class ApiService {
  static const String apiUrl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(const Duration(seconds: 20));

      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.statusCode}');
      }

      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      final List<dynamic> categoriesJson =
          data['categories'] as List<dynamic>? ?? [];

      return categoriesJson.map((item) {
        if (item is! Map<String, dynamic>) {
          throw const FormatException('Invalid category data');
        }

        return Category.fromJson(item);
      }).toList();
    } on FormatException {
      throw Exception('Invalid data received from server');
    } on http.ClientException {
      throw Exception('Network connection failed');
    } catch (e) {
      throw Exception('Unable to fetch categories: $e');
    }
  }
}
