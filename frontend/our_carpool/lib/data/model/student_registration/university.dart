class University {
  final int id;
  final String name;
  final String emailDomain;

  University({required this.id, required this.name, required this.emailDomain});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'],
      name: json['name'],
      emailDomain: json['emailDomain'],
    );
  }

  University.empty()
      : id = 0,
        name = '',
        emailDomain = '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'emailDomain': emailDomain,
      };
}
