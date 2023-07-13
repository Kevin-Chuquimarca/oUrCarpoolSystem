import 'dart:typed_data';

import 'package:our_carpool/data/provider/driver_request_provider.dart';

import '../data/model/driver_request.dart';

class DriverRequestDomain {
  final DriverRequestProvider _driverRequestProvider = DriverRequestProvider();

  Future<DriverRequest> getDriverRequest(int id) async {
    return await _driverRequestProvider.getDriverRequest(id);
  }

  Future<List<DriverRequest>> getDriversRequest() async {
    return await _driverRequestProvider.getDriversRequest();
  }

  Future<Uint8List> getLicensePicture(String fileName) async {
    return await _driverRequestProvider.getLicensePicture(fileName);
  }

  Future<Uint8List> getCarPicture(String fileName) async {
    return await _driverRequestProvider.getCarPicture(fileName);
  }
}
