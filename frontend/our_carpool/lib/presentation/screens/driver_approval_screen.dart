import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import '../../data/model/user.dart';
import '../../domain/user_domain.dart';
import '../../utils/colors.dart';
import 'profile_approved_screen.dart';
import 'profile_denied_screen.dart';

class DriverApprovalScreen extends StatefulWidget {
  const DriverApprovalScreen({super.key, required this.driver});

  final DriverRequest driver;

  @override
  State<DriverApprovalScreen> createState() => _DriverApprovalScreenState();
}

class _DriverApprovalScreenState extends State<DriverApprovalScreen> {
  DriverRequestDomain driverRequestDomain = DriverRequestDomain();
  UserDomain userDomain = UserDomain();

  User user = User.empty();

  _getUser() {
    userDomain.getDataUserByEmail(widget.driver.email).then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

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
              FutureBuilder<Uint8List>(
                future: driverRequestDomain
                    .getLicensePicture(widget.driver.photoLic),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return Center(
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.contain,
                      ),
                    );
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
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
                        'ID: ${user.ci}',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Name: ${user.name}',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Last Name: ${user.lastName}',
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Type License: ${widget.driver.typeLic}',
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
              const Text(
                'PROFILE PHOTO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              // FutureBuilder<Uint8List>(
              //   future: userDomain.getProfilePicture(user.photo),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       return Center(child: Text('Error: ${snapshot.error}'));
              //     } else if (snapshot.hasData) {
              //       return Center(
              //         child: Image.memory(
              //           snapshot.data!,
              //           fit: BoxFit.contain,
              //         ),
              //       );
              //     } else {
              //       return const Center(child: Text('No data available'));
              //     }
              //   },
              // ),
              const SizedBox(height: 16),
              const Text(
                'CAR PHOTO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              FutureBuilder<Uint8List>(
                future:
                    driverRequestDomain.getCarPicture(widget.driver.photoLic),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return Center(
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.contain,
                      ),
                    );
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
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
                        'Plate: ${widget.driver.plateCar}',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileApprovedScreen(idDr: widget.driver.id),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileDeniedScreen(idDr: widget.driver.id),
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
