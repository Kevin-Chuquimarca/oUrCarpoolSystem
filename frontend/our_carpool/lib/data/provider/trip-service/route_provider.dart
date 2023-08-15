import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:our_carpool/data/model/trip-service/route.dart';
import 'package:our_carpool/data/provider/host.dart';

class RouteProvider {
  final String baseUrl = '$hostIp:8082/route';

  Future<Route> get(int idTrip) async {
    final response = await http.get(Uri.parse('$baseUrl/$idTrip'));
    if (response.statusCode == 200) {
      return Route.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load route');
    }
  }
}
