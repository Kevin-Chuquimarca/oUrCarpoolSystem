import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import '../../data/model/user.dart';
import '../../domain/user_domain.dart';
import '../../utils/colors.dart';
import 'profile_approved_screen.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key, required this.driver});

  final DriverRequest driver;

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
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
        title: const Text('Trip Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DRIVER DETAILS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.photo ??
                        ''), // Fallback to a default image if the URL is null
                    backgroundColor: Colors.grey, // Fallback background color
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${user.name} ${user.lastName}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        const Text(
                          'Career: Software',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        const Text(
                          'Phone number: 0986432220',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Redirigir a Whatsapp
                          },
                          icon: const Icon(Icons.chat_bubble,
                              color: Colors.white),
                          label: const Text('CONTACT',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'CAR PHOTO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
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
              const Text(
                'TRIP DETAILS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4.0),
                            const Center(
                              child: Text(
                                'To: Universidad de las Fuerzas Armadas ESPE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 35),
                                  child: const Icon(Icons.location_on,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'From: Place ID',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 35),
                                  child: const Icon(Icons.calendar_today,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Date: Date',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 35),
                                  child: const Icon(Icons.access_time,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Time: Time',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 35),
                                  child: const Icon(Icons.person,
                                      color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Free Seats: Available Seats',
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProfileApprovedScreen(
                  //         driverRequest: widget.driver.id),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  minimumSize: const Size(double.infinity, 0),
                ),
                child: const Text(
                  'RESERVE YOUR SEAT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
