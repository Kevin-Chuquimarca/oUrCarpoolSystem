import 'package:our_carpool/data/provider/role_option_provider.dart';

import '../data/model/option_role.dart';

class OptionRoleDomain {
  final _roleOptionProvider = RoleOptionProvider();

  Future<List<OptionRole>> getRoleOptions(String roleId) async {
    return await _roleOptionProvider.getRoleOptions(roleId);
  }
}
