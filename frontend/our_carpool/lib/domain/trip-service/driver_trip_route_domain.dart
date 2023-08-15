import 'package:our_carpool/data/model/trip-service/driver_trip_route.dart';
import 'package:our_carpool/data/provider/trip-service/driver_trip_route_provider.dart';

class DriverTripRouteDomain {
  final DriverTripRouteProvider _provider = DriverTripRouteProvider();

  Future<List<DriverTripRoute>> get() async {
    return await _provider.get();
  }
}
