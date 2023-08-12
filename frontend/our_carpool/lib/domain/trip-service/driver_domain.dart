import 'dart:io';
import 'dart:typed_data';

import 'package:our_carpool/data/provider/trip-service/driver_provider.dart';

import '../../data/model/trip-service/driver.dart';

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

  Future<bool> saveDriverAndPhotoCar(
      String plateCar, String photoCar, int codUser, File file) async {
    bool response = await saveDriver(plateCar, photoCar, codUser);
    // no se pude guardar la imagen, debido a la corversion del tipo Uint8List a File
    // if (response) {
    //   response = await saveProfilePicture(photoCar, file);
    // }
    return response;
  }
}
