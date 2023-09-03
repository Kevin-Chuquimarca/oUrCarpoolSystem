import './host.dart';
import 'package:http/http.dart' as http;

class DriverApprovalProvider {
  final String _baseUrl = '$hostIp:8081/driver-approval';

  Future<bool> putApprovedDriverRequest(int id, String message) async {
    final response =
        await http.put(Uri.parse('$_baseUrl/approved?id=$id&message=$message'));
    return response.statusCode == 200;
  }

  Future<bool> putRejectedDriverRequest(int id, String message) async {
    final response =
        await http.put(Uri.parse('$_baseUrl/rejected?id=$id&message=$message'));
    return response.statusCode == 200;
  }
}
