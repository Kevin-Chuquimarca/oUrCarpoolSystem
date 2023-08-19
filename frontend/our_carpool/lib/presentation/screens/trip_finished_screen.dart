import 'package:flutter/material.dart';
import 'package:our_carpool/domain/trips_service/trip_domain.dart';
import 'package:our_carpool/presentation/screens/menu/navigation_menu_screen.dart';
import 'package:our_carpool/utils/colors.dart';

class TripFinishedScreen extends StatefulWidget {
  final int id;

  const TripFinishedScreen({super.key, required this.id});

  @override
  State<TripFinishedScreen> createState() => _TripFinishedScreenState();
}

class _TripFinishedScreenState extends State<TripFinishedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColors.greenColor,
                size: 240,
              ),
              const SizedBox(height: 16),
              const Text(
                'TRIP',
                style: TextStyle(
                    fontSize: 40,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'FINISHED',
                style: TextStyle(
                    height: 0.9,
                    fontSize: 40,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  TripDomain tripDomain = TripDomain();
                  tripDomain.finish(widget.id);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationMenuScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Center(
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
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
