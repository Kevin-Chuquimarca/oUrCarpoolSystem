import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:our_carpool/data/model/trips_service/request.dart';
import './host.dart';

class RequestProvider {
  final String baseUrl = '$hostIp:8082/v1/request';

  Future<bool> post(Request request) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(request.toJson()));
    return response.statusCode == 201;
  }

  Future<List<Request>> getByIdDri(int idDri) async {
    final response = await http.get(Uri.parse('$baseUrl/all/id-dri/$idDri'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Request> requests =
          body.map((dynamic item) => Request.fromJson(item)).toList();
      return requests;
    } else {
      throw Exception('Failed to load requests');
    }
  }

  Future<bool> accept(int id) async {
    final response = await http.put(Uri.parse('$baseUrl/accept/$id'));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to accept request');
    }
  }

  Future<bool> deny(int id) async {
    final response = await http.put(Uri.parse('$baseUrl/deny/$id'));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to deny request');
    }
  }
}
