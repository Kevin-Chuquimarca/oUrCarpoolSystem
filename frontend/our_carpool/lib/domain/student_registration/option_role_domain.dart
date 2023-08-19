import 'package:our_carpool/data/provider/student_registration/role_option_provider.dart';

import '../../data/model/student_registration/option_role.dart';

class OptionRoleDomain {
  final _roleOptionProvider = RoleOptionProvider();

  Future<List<OptionRole>> getRoleOptions(String roleId) async {
    return await _roleOptionProvider.getRoleOptions(roleId);
  }
}
