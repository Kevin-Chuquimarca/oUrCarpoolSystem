import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/trips_service/location.dart';
import '../../model/trips_service/trip.dart';
import './host.dart';

class TripLocationProvider {
  final String baseUrl = '$hostIp:8082/v1/trip-location';

  Future<bool> postTrip(Location location, Trip trip) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'location': location.toJson(), 'trip': trip.toJson()}),
    );
    return response.statusCode == 201;
  }
}
