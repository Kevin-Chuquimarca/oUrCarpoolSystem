import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class NoTrips extends StatefulWidget {
  const NoTrips({Key? key}) : super(key: key);

  @override
  State<NoTrips> createState() => _NoTripsState();
}

class _NoTripsState extends State<NoTrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'YOU DON`T HAVE TRIPS',
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
                'Subscribe to a trip to get access',
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
