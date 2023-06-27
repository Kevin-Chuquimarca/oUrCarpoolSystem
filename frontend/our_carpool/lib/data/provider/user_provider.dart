import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:our_carpool/data/model/user.dart';
import '../model/login_response.dart';
import '../model/user_login.dart';

class UserProvider {
  final String baseUrl = 'http://192.168.55.219:8080/user';

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
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to register');
    }
  }
}
