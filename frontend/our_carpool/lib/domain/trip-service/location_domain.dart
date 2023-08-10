import 'package:our_carpool/data/provider/trip-service/location_provider.dart';

import '../../data/model/trip-service/location.dart';

class LocationDomain {
  final LocationProvider _locationProvider = LocationProvider();

  Future<bool> postLocation(double latitude, double longitude) async {
    return _locationProvider.postLocation(latitude, longitude);
  }

  Future<Location> getLocationById(int id) async {
    return _locationProvider.getLocationById(id);
  }
}
