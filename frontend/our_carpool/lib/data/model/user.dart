class User {
  final int id;
  final int idUni;
  final String idRl;
  final String ci;
  final String email;
  final String name;
  final String lastName;
  final String phone;
  final String photo;
  final String career;

  User(
      {required this.id,
      required this.idUni,
      required this.idRl,
      required this.ci,
      required this.email,
      required this.name,
      required this.lastName,
      required this.phone,
      required this.photo,
      required this.career});

  User.empty()
      : id = 0,
        idUni = 0,
        idRl = '',
        ci = '',
        email = '',
        name = '',
        lastName = '',
        phone = '',
        photo = '',
        career = '';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      idUni: json['idUni'],
      idRl: json['idRl'],
      ci: json['ci'],
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
        'idRl': idRl,
        'ci': ci,
        'email': email,
        'name': name,
        'lastName': lastName,
        'phone': phone,
        'photo': photo,
        'career': career
      };
}
