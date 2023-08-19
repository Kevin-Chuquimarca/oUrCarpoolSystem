class LoginResponse {
  bool access = false;

  LoginResponse(this.access);

  LoginResponse.fromJson(Map<String, dynamic> json) {
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    return {'access': access};
  }
}
