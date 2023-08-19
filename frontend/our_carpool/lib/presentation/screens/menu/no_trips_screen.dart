import 'package:flutter/material.dart';
import 'package:our_carpool/domain/trips_service/trip_domain.dart';
import 'package:our_carpool/presentation/screens/current_trip_screen.dart';
import '../../../utils/colors.dart';

import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/domain/student_registration/user_domain.dart';
import 'package:provider/provider.dart';

class NoTrips extends StatefulWidget {
  const NoTrips({Key? key}) : super(key: key);

  @override
  State<NoTrips> createState() => _NoTripsState();
}

class _NoTripsState extends State<NoTrips> {
  bool haveAvailableTrip = true;

  final UserDomain userDomain = UserDomain();

  _getRequestsDriver() {
    TripDomain tripDomain = TripDomain();
    int idDri = context.read<UserManager>().user.id;
    tripDomain.haveAvailableTrip(idDri).then((value) {
      setState(() {
        haveAvailableTrip = value;
      });
    });
  }

  @override
  void initState() {
    _getRequestsDriver();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (haveAvailableTrip)
        ? const CurrentTripScreen()
        : Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset(
                      'assets/images/Warning_No_Trips.png',
                      width: 300,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: const Center(
                        child: Text(
                          'YOU DON`T HAVE TRIP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              height: 1.1,
                              color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Create a trip to Start',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          );
  }
}
