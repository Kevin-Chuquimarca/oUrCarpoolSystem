import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:our_carpool/data/model/trip-service/request.dart';
import 'package:our_carpool/data/provider/host.dart';

class RequestProvider {
  final String baseUrl = '$hostIp:8082/request';

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
