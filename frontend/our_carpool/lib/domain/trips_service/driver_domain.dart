import 'dart:io';
import 'dart:typed_data';

import 'package:our_carpool/data/provider/trips_service/driver_provider.dart';

import '../../data/model/trips_service/driver.dart';

class DriverDomain {
  final DriverProvider _driverProvider = DriverProvider();

  Future<Driver> getDriver(int id) async {
    return _driverProvider.getDriver(id);
  }

  Future<bool> saveDriver(String plateCar, String photoCar, int codUser) async {
    return _driverProvider.postDriver(Driver(
        id: codUser,
        idLoc: null,
        plateCar: plateCar,
        photoCar: photoCar,
        codUser: codUser));
  }

  Future<bool> saveProfilePicture(String photoCar, File file) async {
    return _driverProvider.postProfilePicture(photoCar, file);
  }

  Future<Uint8List> getProfilePicture(String fileName) async {
    return _driverProvider.getProfilePicture(fileName);
  }
}
