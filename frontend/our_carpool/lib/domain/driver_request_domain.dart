import 'dart:io';
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

  Future<bool> postDriverRequest(
      int idAd,
      String email,
      DateTime shippingDate,
      DateTime approvalDate,
      String typeLic,
      DateTime expiryDateLic,
      String photoLic,
      String plateCar,
      String photoCar,
      String state,
      String message,
      File licenseImg,
      File carImg) async {
    DriverRequest driverRequestToSend = DriverRequest(
        id: 0,
        idAd: idAd,
        email: email,
        shippingDate: shippingDate,
        approvalDate: approvalDate,
        typeLic: typeLic,
        expiryDateLic: expiryDateLic,
        photoLic: photoLic,
        plateCar: plateCar,
        photoCar: photoCar,
        state: state,
        message: message);
    bool responsePostDriver =
        await _driverRequestProvider.postDriverRequest(driverRequestToSend);
    bool responsePostLicense =
        await _driverRequestProvider.postLicenseImage(plateCar, licenseImg);
    bool responsePostCar =
        await _driverRequestProvider.postCarImage(plateCar, carImg);
    return responsePostDriver && responsePostLicense && responsePostCar;
  }

  Future<bool> sendApprovedDriverRequest(int id, String message) async {
    return await _driverRequestProvider.putApprovedDriverRequest(id, message);
  }

  Future<bool> sendRejectedDriverRequest(int id, String message) async {
    return await _driverRequestProvider.putRejectedDriverRequest(id, message);
  }

  Future<List<DriverRequest>> getAllPending() async {
    return await _driverRequestProvider.getAllPending();
  }

  Future<List<DriverRequest>> getAllApproved() async {
    return await _driverRequestProvider.getAllApproved();
  }

  Future<List<DriverRequest>> getAllRejected() async {
    return await _driverRequestProvider.getAllRejected();
  }
}
