import 'package:our_carpool/data/provider/trip-service/trip_provider.dart';

import '../../data/model/trip-service/trip.dart';

class TripDomain {
  final TripProvider _tripProvider = TripProvider();

  Future<bool> createTrip(Trip trip) async {
    return _tripProvider.postTrip(trip);
  }

  Future<Trip> getTrip(int id) async {
    return _tripProvider.getTrip(id);
  }
}
