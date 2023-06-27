import 'package:our_carpool/domain/user_domain.dart';

class LogInManager {
  Future<bool> validateUser(String email, String password) async {
    UserDomain userLoginRepository = UserDomain();
    bool access = await userLoginRepository.loginUser(email, password);
    return access;
  }
}
