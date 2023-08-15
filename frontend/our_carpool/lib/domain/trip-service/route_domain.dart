import 'package:our_carpool/data/model/trip-service/route.dart';
import 'package:our_carpool/data/provider/trip-service/route_provider.dart';

class RouteDomain {
  final RouteProvider _routeProvider = RouteProvider();

  Future<Route> get(int idTrip) async {
    return await _routeProvider.get(idTrip);
  }
}
