import 'package:our_carpool/data/model/trip-service/passenger.dart';
import 'package:our_carpool/data/provider/trip-service/passenger_provider.dart';

class PassengerDomain {
  final PassengerProvider _passengerProvider = PassengerProvider();

  Future<Passenger> get(int id) async {
    return await _passengerProvider.get(id);
  }
}
