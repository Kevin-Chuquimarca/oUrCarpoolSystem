import 'package:our_carpool/data/provider/driver_approval/driver_approval_provider.dart';

class DriverApprovalDomain {
  final _driverApprovalProvider = DriverApprovalProvider();

  Future<bool> sendApprovedDriverRequest(int id, String message) async {
    return await _driverApprovalProvider.putApprovedDriverRequest(id, message);
  }

  Future<bool> sendRejectedDriverRequest(int id, String message) async {
    return await _driverApprovalProvider.putRejectedDriverRequest(id, message);
  }
}
