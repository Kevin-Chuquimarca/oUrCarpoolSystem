import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:our_carpool/presentation/screens/current_trip_map.dart';
import 'package:our_carpool/presentation/screens/request_trips_screen.dart';
import 'package:our_carpool/presentation/screens/trip_screen.dart';
import '../../utils/colors.dart';

class CurrentTripScreen extends StatefulWidget {
  const CurrentTripScreen({Key? key}) : super(key: key);

  @override
  State<CurrentTripScreen> createState() => _CurrentTripScreenState();
}

class _CurrentTripScreenState extends State<CurrentTripScreen> {
  LatLng center = const LatLng(-1.8312, -78.1834);

  void setCenter(LatLng newCenter) {
    setState(() {
      center = newCenter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/Current_Trip_Start.png',
                width: 300,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: const Center(
                  child: Text(
                    'ARE YOU READY TO START?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Check Your Tires...',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CurrentTripMap(
                    //         center: center, setCenter: setCenter),
                    //   ),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TripScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 52),
                  ),
                  child: const Text(
                    'START!',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RequestTripsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 52),
                  ),
                  child: const Text(
                    'CHECK THE PASSENGER LIST',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
