import 'package:our_carpool/data/model/trips_service/driver_trip_route.dart';
import 'package:our_carpool/data/provider/trips_service/driver_trip_route_provider.dart';

class DriverTripRouteDomain {
  final DriverTripRouteProvider _provider = DriverTripRouteProvider();

  Future<List<DriverTripRoute>> get() async {
    return await _provider.get();
  }
}
