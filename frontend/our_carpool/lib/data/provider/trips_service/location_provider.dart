import 'package:our_carpool/data/model/trips_service/location.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import './host.dart';

class LocationProvider {
  final String baseUrl = '$hostIp:8082/v1/location';

  Future<Location> getLocationById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Location.fromJson(json.decode(response.body));
    } else {
      return Location.empty();
    }
  }

  Future<bool> postLocation(Location location) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(location.toJson()),
    );
    return response.statusCode == 201;
  }

  Future<bool> update(int id, Location location) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(location.toJson()),
    );
    return response.statusCode == 200;
  }
}
