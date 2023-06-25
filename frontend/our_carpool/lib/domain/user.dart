class User {
  String? email;
  String? password;
  bool access = false;

  User({this.email, this.password, this.access = false});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'access': access,
    };
  }
}
