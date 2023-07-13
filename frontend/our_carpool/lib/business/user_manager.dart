import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/option_role.dart';

import '../data/model/user.dart';
import '../domain/user_domain.dart';

class UserManager with ChangeNotifier {
  User user = User.empty();
  Uint8List profilePicture = Uint8List(0);
  List<OptionRole> optionsRole = List.empty();

  void setUser(User user) {
    this.user = user;
    notifyListeners();
  }

  void setProfilePicture(Uint8List profilePicture) {
    this.profilePicture = profilePicture;
    notifyListeners();
  }

  Future<void> getUserData(String email) async {
    UserDomain userDomain = UserDomain();
    User user = await userDomain.getDataUserByEmail(email);
    setUser(user);
    Uint8List profilePicture = await userDomain.getProfilePicture(user.photo);
    setProfilePicture(profilePicture);
  }

  Future<bool> validateUser(String email, String password) async {
    UserDomain userDomain = UserDomain();
    bool access = await userDomain.loginUser(email, password);
    return access;
  }
}
