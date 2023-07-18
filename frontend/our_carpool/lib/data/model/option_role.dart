class OptionRole {
  final String id;
  final String name;

  OptionRole({required this.id, required this.name});

  factory OptionRole.fromJson(Map<String, dynamic> json) {
    return OptionRole(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
