import 'package:our_carpool/data/model/trips_service/location.dart';
import 'package:our_carpool/data/provider/trips_service/trip_location_provider.dart';

import '../../data/model/trips_service/trip.dart';

class TripLocationDomain {
  final TripLocationProvider _tripLocationProvider = TripLocationProvider();

  Future<bool> createTripLocation(Location location, Trip trip) async {
    return await _tripLocationProvider.postTrip(location, trip);
  }
}
