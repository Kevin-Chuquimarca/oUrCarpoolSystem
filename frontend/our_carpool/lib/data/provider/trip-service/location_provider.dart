import 'package:our_carpool/data/model/trip-service/location.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../host.dart';

class LocationProvider {
  final String baseUrl = '$hostIp::8082/location';

  Future<Location> getLocationById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Location.fromJson(json.decode(response.body));
    } else {
      return Location.empty();
    }
  }

  Future<bool> postLocation(double latitude, double longitude) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'latitude': latitude, 'longitude': longitude}),
    );
    return response.statusCode == 201;
  }
}
