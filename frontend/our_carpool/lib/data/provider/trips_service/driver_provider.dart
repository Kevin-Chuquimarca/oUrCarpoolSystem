import 'dart:io';
import 'dart:typed_data';

import 'package:our_carpool/data/model/trips_service/driver.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import './host.dart';

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

  Future<bool> postDriver(Driver driver) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(driver.toJson()));
    return response.statusCode == 201;
  }

  Future<bool> postProfilePicture(String photoCar, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/img'));
    request.fields['plateCar'] = photoCar;
    request.files.add(await http.MultipartFile.fromPath('photo', file.path));
    var response = await request.send();
    return response.statusCode == 201;
  }

  Future<Uint8List> getProfilePicture(String fileName) async {
    final response = await http.get(Uri.parse('$baseUrl/img/$fileName'));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch image');
    }
  }
}
