import 'package:our_carpool/data/provider/trip-service/driver_provider.dart';

import '../../data/model/trip-service/driver.dart';

class DriverDomain {
  final DriverProvider _driverProvider = DriverProvider();

  Future<Driver> getDriver(int id) async {
    return _driverProvider.getDriver(id);
  }
}
