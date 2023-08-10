class Location {
  final int id;
  final double lat;
  final double lng;
  final String name;

  Location({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
  });

  Location.empty()
      : id = 0,
        lat = 0,
        lng = 0,
        name = '';

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'lat': lat,
        'lng': lng,
        'name': name,
      };
}
