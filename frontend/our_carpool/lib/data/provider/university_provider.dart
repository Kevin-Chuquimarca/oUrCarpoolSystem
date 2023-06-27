import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/university.dart';

class UniversityProvider {
  final String baseUrl = 'http://192.168.55.219:8080/university';

  Future<List<University>> getUniversities() async {
    final response = await http.get(Uri.parse('$baseUrl/all'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<University> universities =
          list.map((model) => University.fromJson(model)).toList();
      return universities;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
