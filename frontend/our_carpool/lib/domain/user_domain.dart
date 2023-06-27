import '../data/model/login_response.dart';
import '../data/model/user.dart';
import '../data/model/user_login.dart';
import '../data/provider/user_provider.dart';

class UserDomain {
  final UserProvider _userProvider = UserProvider();

  Future<bool> loginUser(String email, String password) async {
    LoginResponse loginResponse = await UserProvider()
        .postLogin(UserLogin(email: email, password: password));
    return loginResponse.access;
  }

  Future<bool> registerUser(int idUni, String email, String name,
      String lastName, String phone, String photo, String career) async {
    bool response = await _userProvider.postUser(User(
        id: 0,
        idUni: idUni,
        email: email,
        name: name,
        lastName: lastName,
        phone: phone,
        photo: photo,
        career: career));
    return response;
  }
}
