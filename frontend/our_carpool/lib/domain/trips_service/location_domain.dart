import 'package:our_carpool/data/provider/trips_service/location_provider.dart';

import '../../data/model/trips_service/location.dart';

class LocationDomain {
  final LocationProvider _locationProvider = LocationProvider();

  Future<bool> postLocation(
      double latitude, double longitude, String name) async {
    return _locationProvider.postLocation(
        Location(id: 0, lat: latitude, lng: longitude, name: name));
  }

  Future<Location> getLocationById(int id) async {
    return _locationProvider.getLocationById(id);
  }

  Future<bool> update(
      int id, double latitude, double longitude, String name) async {
    return _locationProvider.update(
        id, Location(id: id, lat: latitude, lng: longitude, name: name));
  }
}
