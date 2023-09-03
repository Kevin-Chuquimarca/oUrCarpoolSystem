import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:our_carpool/data/model/trips_service/route.dart';
import './host.dart';

class RouteProvider {
  final String baseUrl = '$hostIp:8082/v1/route';

  Future<Route> get(int idTrip) async {
    final response = await http.get(Uri.parse('$baseUrl/$idTrip'));
    if (response.statusCode == 200) {
      return Route.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load route');
    }
  }
}
