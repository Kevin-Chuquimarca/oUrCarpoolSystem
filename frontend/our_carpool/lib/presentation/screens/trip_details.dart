import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/trip-service/driver_trip_route.dart';
import 'package:our_carpool/data/model/trip-service/request.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import 'package:our_carpool/domain/trip-service/request_domain.dart';
import 'package:our_carpool/domain/user_domain.dart';
import 'package:our_carpool/presentation/screens/menu/navigation_menu_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/user.dart';
import '../../utils/colors.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key, required this.dtr, required this.user});

  final DriverTripRoute dtr;
  final User user;

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  DriverRequestDomain driverRequestDomain = DriverRequestDomain();
  UserDomain userDomain = UserDomain();

  @override
  void initState() {
    super.initState();
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
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: ClipOval(
                      child: FutureBuilder<Uint8List>(
                        future: userDomain.getProfilePicture(widget.user.photo),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            return Center(
                              child: Image.memory(
                                snapshot.data!,
                                fit: BoxFit.contain,
                              ),
                            );
                          } else {
                            return const Center(
                                child: Text('No data available'));
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${widget.user.name} ${widget.user.lastName}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'Career: ${widget.user.career}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'Phone number: ${widget.user.phone}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final message =
                                'Hola ${widget.user.name} ${widget.user.lastName}, te escribo por el puesto disponible para el recorrido.';
                            final phoneNumber = '593${widget.user.phone}';
                            final whatsappUrl =
                                'whatsapp://send/?phone=$phoneNumber&text=${Uri.encodeComponent(message)}';

                            try {
                              await launch(whatsappUrl);
                            } catch (e) {
                              // Manejar el error, mostrar un mensaje al usuario
                              print('Error al abrir el enlace: $e');
                            }
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
                future: driverRequestDomain
                    .getCarPicture(widget.dtr.driver.photoCar),
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
                            Center(
                              child: Text(
                                'To: ${widget.dtr.endLocation.name}',
                                style: const TextStyle(
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
                                Text(
                                  'From: ${widget.dtr.startLocation.name}',
                                  style: const TextStyle(
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
                                Text(
                                  'Date: ${widget.dtr.trip.date.toString().substring(0, 10)}',
                                  style: const TextStyle(
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
                                Text(
                                  'Time: ${widget.dtr.trip.leaveHour.toString().substring(11, 16)}',
                                  style: const TextStyle(
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
                                Text(
                                  'Free Seats: ${widget.dtr.trip.freeSeats}',
                                  style: const TextStyle(
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
                  RequestDomain requestDomain = RequestDomain();
                  requestDomain
                      .create(Request(
                          id: 0,
                          idDri: widget.dtr.driver.id,
                          idPas: widget.user.id,
                          nameU: widget.user.name,
                          lastNameU: widget.user.lastName,
                          phoneU: widget.user.phone,
                          date: DateTime.now(),
                          state: "P"))
                      .then((value) => {
                            if (value)
                              {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NavigationMenuScreen()),
                                  (route) => false,
                                ),
                              }
                            else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Failed to register user'),
                                  ),
                                )
                              }
                          });
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
