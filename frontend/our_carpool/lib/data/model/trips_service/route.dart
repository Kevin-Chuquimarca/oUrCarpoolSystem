import 'package:our_carpool/data/model/trips_service/location.dart';

class Route {
  final List<Location> locations;

  Route({required this.locations});

  factory Route.fromJson(Map<String, dynamic> json) {
    var list = json['locations'] as List;
    List<Location> locationsList =
        list.map((i) => Location.fromJson(i)).toList();

    return Route(locations: locationsList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locations'] = locations.map((v) => v.toJson()).toList();
    return data;
  }
}
