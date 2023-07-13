import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import '../model/driver_request.dart';

class DriverRequestProvider {
  final String _baseUrl = 'http://192.168.55.219:8081/driver-request';

  Future<DriverRequest> getDriverRequest(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      return DriverRequest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load driver request');
    }
  }

  Future<List<DriverRequest>> getDriversRequest() async {
    final response = await http.get(Uri.parse('$_baseUrl/all'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<DriverRequest> driversRequest =
          list.map((model) => DriverRequest.fromJson(model)).toList();
      return driversRequest;
    } else {
      throw Exception('Failed to load driver request');
    }
  }

  Future<Uint8List> getLicensePicture(String fileName) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/license-img/$fileName'));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch image');
    }
  }

  Future<Uint8List> getCarPicture(String fileName) async {
    final response = await http.get(Uri.parse('$_baseUrl/car-img/$fileName'));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch image');
    }
  }
}
