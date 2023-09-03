import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:our_carpool/data/model/driver_approval/driver_request.dart';
import './host.dart';

class DriverRequestProvider {
  final String _baseUrl = '$hostIp:8081/v1/driver-request';

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

  Future<bool> postDriverRequest(DriverRequest driverRequest) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(driverRequest),
    );
    return response.statusCode == 201;
  }

  Future<bool> postLicenseImage(String plateCar, File file) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl/license-img'));
    request.fields['plateCar'] = plateCar;
    request.files.add(await http.MultipartFile.fromPath('photo', file.path));
    var response = await request.send();
    return response.statusCode == 201;
  }

  Future<bool> postCarImage(String plateCar, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/car-img'));
    request.fields['plateCar'] = plateCar;
    request.files.add(await http.MultipartFile.fromPath('photo', file.path));
    var response = await request.send();
    return response.statusCode == 201;
  }

  Future<List<DriverRequest>> getAllPending() async {
    final response = await http.get(Uri.parse('$_baseUrl/pending/all'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<DriverRequest> driversRequest =
          list.map((model) => DriverRequest.fromJson(model)).toList();
      return driversRequest;
    } else {
      throw Exception('Failed to load driver request');
    }
  }

  Future<List<DriverRequest>> getAllApproved() async {
    final response = await http.get(Uri.parse('$_baseUrl/approved/all'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<DriverRequest> driversRequest =
          list.map((model) => DriverRequest.fromJson(model)).toList();
      return driversRequest;
    } else {
      throw Exception('Failed to load driver request');
    }
  }

  Future<List<DriverRequest>> getAllRejected() async {
    final response = await http.get(Uri.parse('$_baseUrl/rejected/all'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<DriverRequest> driversRequest =
          list.map((model) => DriverRequest.fromJson(model)).toList();
      return driversRequest;
    } else {
      throw Exception('Failed to load driver request');
    }
  }
}
