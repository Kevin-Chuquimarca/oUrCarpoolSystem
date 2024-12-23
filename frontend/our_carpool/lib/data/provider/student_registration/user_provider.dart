import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:our_carpool/data/model/student_registration/user.dart';
import '../../model/student_registration/login_response.dart';
import '../../model/student_registration/user_login.dart';
import './host.dart';

class UserProvider {
  final String baseUrl = '$hostIp:8080/v1/user';

  Future<User> getById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<User> getUserByEmail(String email) async {
    final response = await http.get(Uri.parse('$baseUrl/email/$email'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<bool> checkIfUserExists(String email) async {
    final response = await http.get(Uri.parse('$baseUrl/email/exist/$email'));
    return response.statusCode == 200;
  }

  Future<LoginResponse> postLogin(UserLogin userLogin) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userLogin),
    );
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<bool> postUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
    return response.statusCode == 201;
  }

  Future<bool> postProfilePicture(String ci, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/img'));
    request.fields['CI'] = ci;
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
