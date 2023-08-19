import 'package:our_carpool/data/model/trips_service/route.dart';
import 'package:our_carpool/data/provider/trips_service/route_provider.dart';

class RouteDomain {
  final RouteProvider _routeProvider = RouteProvider();

  Future<Route> get(int idTrip) async {
    return await _routeProvider.get(idTrip);
  }
}
