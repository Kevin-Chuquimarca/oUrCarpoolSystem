import 'package:our_carpool/data/model/trip-service/location.dart';
import 'package:our_carpool/data/provider/trip-service/trip_location_provider.dart';

import '../../data/model/trip-service/trip.dart';

class TripLocationDomain {
  final TripLocationProvider _tripLocationProvider = TripLocationProvider();

  Future<bool> createTripLocation(Location location, Trip trip) async {
    return await _tripLocationProvider.postTrip(location, trip);
  }
}
