import 'package:our_carpool/data/model/trip-service/driver.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../host.dart';

class DriverProvider {
  final String baseUrl = '$hostIp:8082/driver';

  Future<Driver> getDriver(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Driver.fromJson(json.decode(response.body));
    } else {
      return Driver.empty();
    }
  }
}
