class UserLogin {
  String? email;
  String? password;

  UserLogin({this.email, this.password});

  UserLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
