import 'package:flutter/material.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import 'package:our_carpool/utils/colors.dart';

import 'navigation_menu_screen.dart';

class ProfileApprovedScreen extends StatefulWidget {
  const ProfileApprovedScreen({super.key, required this.idDr});

  final int idDr;

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
                  driverRequestDomain
                      .sendApprovedDriverRequest(
                          widget.idDr, "approved driver request")
                      .then((value) => {
                            if (value)
                              {
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
