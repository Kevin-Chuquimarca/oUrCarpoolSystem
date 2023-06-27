class User {
  final int id;
  final int idUni;
  final String email;
  final String name;
  final String lastName;
  final String phone;
  final String photo;
  final String career;

  User(
      {required this.id,
      required this.idUni,
      required this.email,
      required this.name,
      required this.lastName,
      required this.phone,
      required this.photo,
      required this.career});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      idUni: json['idUni'],
      email: json['email'],
      name: json['name'],
      lastName: json['lastName'],
      phone: json['phone'],
      photo: json['photo'],
      career: json['career'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'idUni': idUni,
        'email': email,
        'name': name,
        'lastName': lastName,
        'phone': phone,
        'photo': photo,
        'career': career
      };
}
