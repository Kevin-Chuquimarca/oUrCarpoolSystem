import 'dart:io';
import 'dart:typed_data';

import '../data/model/login_response.dart';
import '../data/model/user.dart';
import '../data/model/user_login.dart';
import '../data/provider/user_provider.dart';

class UserDomain {
  final UserProvider _userProvider = UserProvider();

  Future<User> getById(int id) async {
    User user = await _userProvider.getById(id);
    return user;
  }

  Future<bool> loginUser(String email, String password) async {
    LoginResponse loginResponse = await UserProvider()
        .postLogin(UserLogin(email: email, password: password));
    return loginResponse.access;
  }

  Future<User> getDataUserByEmail(String email) async {
    User user = await _userProvider.getUserByEmail(email);
    return user;
  }

  Future<bool> checkIfUserExists(String email) async {
    bool response = await _userProvider.checkIfUserExists(email);
    return response;
  }

  Future<bool> registerNewUser(
      int idUni,
      String ci,
      String email,
      String name,
      String lastName,
      String phone,
      String photo,
      String career,
      File file) async {
    bool resPostUser = await _userProvider.postUser(User(
        id: 0,
        idUni: idUni,
        idRl: 'psg',
        ci: ci,
        email: email,
        name: name,
        lastName: lastName,
        phone: phone,
        photo: photo,
        career: career));
    bool resPostPicture = await _userProvider.postProfilePicture(ci, file);
    return resPostUser && resPostPicture;
  }

  // Future<bool> registerUser(int idUni, String ci, String email, String name,
  //     String lastName, String phone, String photo, String career) async {
  //   bool response = await _userProvider.postUser(User(
  //       id: 0,
  //       idUni: idUni,
  //       idRl: 'psg',
  //       ci: ci,
  //       email: email,
  //       name: name,
  //       lastName: lastName,
  //       phone: phone,
  //       photo: photo,
  //       career: career));
  //   return response;
  // }

  // Future<bool> uploadProfilePicture(String ci, File file) async {
  //   bool response = await _userProvider.postProfilePicture(ci, file);
  //   return response;
  // }

  Future<Uint8List> getProfilePicture(String photo) async {
    Uint8List response = await _userProvider.getProfilePicture(photo);
    return response;
  }
}
