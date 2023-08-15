import 'package:our_carpool/data/model/trip-service/trip.dart';

import 'driver.dart';
import 'location.dart';

class DriverTripRoute {
  final Driver driver;
  final Trip trip;
  final Location startLocation;
  final Location endLocation;

  DriverTripRoute(
      {required this.driver,
      required this.trip,
      required this.startLocation,
      required this.endLocation});

  factory DriverTripRoute.fromJson(Map<String, dynamic> json) {
    return DriverTripRoute(
        driver: Driver.fromJson(json['driver']),
        trip: Trip.fromJson(json['trip']),
        startLocation: Location.fromJson(json['startLocation']),
        endLocation: Location.fromJson(json['endLocation']));
  }

  Map<String, dynamic> toJson() => {
        'driver': driver.toJson(),
        'trip': trip.toJson(),
        'startLocation': startLocation.toJson(),
        'endLocation': endLocation.toJson()
      };
}
