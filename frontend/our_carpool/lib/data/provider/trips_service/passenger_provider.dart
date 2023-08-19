import 'package:our_carpool/data/model/trips_service/passenger.dart';
import 'package:our_carpool/data/provider/host.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class PassengerProvider {
  final String baseUrl = '$hostIp:8082/passenger';

  Future<Passenger> get(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Passenger.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load passenger');
    }
  }
}
