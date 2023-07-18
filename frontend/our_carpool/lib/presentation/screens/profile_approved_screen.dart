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
              'PROFILE APPROVED',
              style: TextStyle(fontSize: 40, color: AppColors.greenColor),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                DriverRequestDomain driverRequestDomain = DriverRequestDomain();
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
              child: const Text("Accept"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"))
          ],
        ),
      ),
    );
  }
}
