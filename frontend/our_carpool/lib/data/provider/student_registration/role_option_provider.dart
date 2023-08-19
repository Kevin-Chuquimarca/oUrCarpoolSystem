import 'package:our_carpool/data/model/student_registration/option_role.dart';

import '../host.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RoleOptionProvider {
  final String _baseUrl = '$hostIp:8080/role-option';

  Future<List<OptionRole>> getRoleOptions(String roleId) async {
    final response = await http.get(Uri.parse('$_baseUrl/options/$roleId'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((option) => OptionRole.fromJson(option)).toList();
    } else {
      throw Exception('Failed to load options to role');
    }
  }
}
