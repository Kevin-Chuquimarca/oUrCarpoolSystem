import 'dart:io';

import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import 'package:our_carpool/domain/trip-service/driver_domain.dart';
import 'package:our_carpool/utils/colors.dart';

import 'menu/navigation_menu_screen.dart';

class ProfileApprovedScreen extends StatefulWidget {
  const ProfileApprovedScreen(
      {super.key, required this.driverRequest, required this.photoCar});

  final DriverRequest driverRequest;
  final File photoCar;

  @override
  State<ProfileApprovedScreen> createState() => _ProfileApprovedScreenState();
}

class _ProfileApprovedScreenState extends State<ProfileApprovedScreen> {
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
                'PROFILE',
                style: TextStyle(
                    fontSize: 40,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'APPROVED',
                style: TextStyle(
                    fontSize: 40,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  DriverRequestDomain driverRequestDomain =
                      DriverRequestDomain();
                  DriverDomain driverDomain = DriverDomain();

                  driverRequestDomain
                      .sendApprovedDriverRequest(
                          widget.driverRequest.id, "approved driver request")
                      .then((value) => {
                            if (value)
                              {
                                driverDomain.saveDriverAndPhotoCar(
                                    widget.driverRequest.plateCar,
                                    widget.driverRequest.photoCar,
                                    widget.driverRequest.codUser,
                                    widget.photoCar),
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NavigationMenuScreen(),
                                  ),
                                  (route) => false,
                                )
                              }
                            else
                              {
                                Navigator.pop(context),
                              }
                          });
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: Center(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
