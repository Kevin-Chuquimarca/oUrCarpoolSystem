import 'package:our_carpool/data/model/trip-service/trip.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../host.dart';

class TripProvider {
  final String baseUrl = '$hostIp:8082/trip';

  Future<Trip> getTrip(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Trip.fromJson(json.decode(response.body));
    } else {
      return Trip.empty();
    }
  }

  Future<bool> postTrip(Trip trip) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(trip.toJson()),
    );
    return response.statusCode == 201;
  }

  Future<bool> haveAvailableTrip(int idTrip) async {
    final response =
        await http.get(Uri.parse('$baseUrl/have-available/$idTrip'));
    return response.statusCode == 200;
  }
}
