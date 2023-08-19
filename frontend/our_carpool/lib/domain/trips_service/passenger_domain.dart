import 'package:our_carpool/data/model/trips_service/passenger.dart';
import 'package:our_carpool/data/provider/trips_service/passenger_provider.dart';

class PassengerDomain {
  final PassengerProvider _passengerProvider = PassengerProvider();

  Future<Passenger> get(int id) async {
    return await _passengerProvider.get(id);
  }
}
