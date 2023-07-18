import 'package:flutter/material.dart';
import 'package:our_carpool/utils/colors.dart';

import '../../domain/driver_request_domain.dart';
import 'navigation_menu_screen.dart';

class ProfileDeniedScreen extends StatefulWidget {
  const ProfileDeniedScreen({super.key, required this.idDr});

  final int idDr;

  @override
  State<ProfileDeniedScreen> createState() => _ProfileDeniedScreenState();
}

class _ProfileDeniedScreenState extends State<ProfileDeniedScreen> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColors.redColor,
              size: 240,
            ),
            const SizedBox(height: 16),
            const Text(
              'PROFILE DENIED',
              style: TextStyle(fontSize: 40, color: AppColors.greenColor),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the message';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                DriverRequestDomain driverRequestDomain = DriverRequestDomain();
                driverRequestDomain
                    .sendRejectedDriverRequest(
                        widget.idDr, _messageController.text)
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
      )),
    );
  }
}
