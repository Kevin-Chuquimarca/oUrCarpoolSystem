import 'package:flutter/material.dart';
import 'package:our_carpool/domain/driver_approval/driver_approval_domain.dart';
import 'package:our_carpool/utils/colors.dart';
import 'menu/navigation_menu_screen.dart';

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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                    'PROFILE',
                    style: TextStyle(
                        fontSize: 40,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'DENIED',
                    style: TextStyle(
                        fontSize: 40,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.bold),
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
                            color: AppColors.redColor,
                          ),
                        ),
                        hintText:
                            'The reason the request has been denied is...'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        DriverApprovalDomain driverApprovalDomain =
                            DriverApprovalDomain();
                        driverApprovalDomain
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
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.redColor,
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
                      foregroundColor: AppColors.redColor,
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
        ),
      ),
    );
  }
}
