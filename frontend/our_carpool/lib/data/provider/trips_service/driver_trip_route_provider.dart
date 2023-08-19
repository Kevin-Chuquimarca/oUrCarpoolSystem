import 'package:our_carpool/data/model/trips_service/driver_trip_route.dart';
import 'package:our_carpool/data/provider/host.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DriverTripRouteProvider {
  final String baseUrl = '$hostIp:8082/driver-trip-route';

  Future<List<DriverTripRoute>> get() async {
    final response = await http.get(Uri.parse('$baseUrl/available/all'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => DriverTripRoute.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load driver trip route');
    }
  }
}
