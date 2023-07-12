import 'package:flutter/material.dart';
import '../../data/model/driver.dart';
import '../../business/user_manager.dart';
import '../../utils/colors.dart';
import 'package:provider/provider.dart';
import 'profile_approved_screen.dart';
import 'profile_denied_screen.dart';

class DriverApprovalScreen extends StatefulWidget {
  final Driver driver;

  const DriverApprovalScreen({super.key, required this.driver});

  @override
  State<DriverApprovalScreen> createState() => _DriverApprovalScreenState();
}

class _DriverApprovalScreenState extends State<DriverApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Approval'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LICENSE PHOTO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 337,
                height: 200,
                child: widget.driver.photoLicense.isNotEmpty
                    ? Image.network(
                        widget.driver.photoLicense,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "No image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PROFILE PHOTO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 283,
                height: 283,
                child: context.watch<UserManager>().profilePicture.isNotEmpty
                    ? Image.memory(
                        context.watch<UserManager>().profilePicture,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "No image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PERSONAL INFORMATION',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${context.watch<UserManager>().user.id}',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Name: ${context.watch<UserManager>().user.name}',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Last Name: ${context.watch<UserManager>().user.lastName}',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Type License: ${widget.driver.licenseType}',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // Lógica para aceptar al conductor
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ProfileApprovedScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'ACCEPT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          // Lógica para rechazar al conductor
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileDeniedScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'DENY',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
