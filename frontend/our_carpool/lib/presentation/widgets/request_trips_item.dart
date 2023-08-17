import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/trip-service/request.dart';
import 'package:our_carpool/domain/trip-service/passenger_domain.dart';
import 'package:our_carpool/domain/trip-service/request_domain.dart';
import 'package:our_carpool/domain/user_domain.dart';
import '../../utils/colors.dart';

class RequestTripsItem extends StatefulWidget {
  final Request request;

  const RequestTripsItem({
    super.key,
    required this.request,
  });

  @override
  State<RequestTripsItem> createState() => _RequestTripsItemState();
}

class _RequestTripsItemState extends State<RequestTripsItem> {
  final UserDomain userDomain = UserDomain();
  final RequestDomain requestDomain = RequestDomain();
  final PassengerDomain passengerDomain = PassengerDomain();
  bool isAcceptedOrDenied = false;

  void setIsAcceptedOrDenied() {
    setState(() {
      isAcceptedOrDenied = true;
    });
  }

  Future<Uint8List> getProfilePicture() async {
    final passenger = await passengerDomain.get(widget.request.id);
    final user = await userDomain.getById(passenger.codUser);
    return await userDomain.getProfilePicture(user.photo);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Column for profile photo
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: ClipOval(
                      child: FutureBuilder<Uint8List>(
                        future: getProfilePicture(),
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
                ],
              ),
              const SizedBox(width: 16),
              // Column for passenger info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${widget.request.nameU} ${widget.request.lastNameU}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Phone: ${widget.request.phoneU}',
                      style: const TextStyle(fontSize: 13.0),
                    ),
                    Text(
                      'Request Date: ${widget.request.date.toString().substring(0, 10)}',
                      style: const TextStyle(fontSize: 13.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Column for buttons
              if (widget.request.state == 'P' && !isAcceptedOrDenied)
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        requestDomain.accept(widget.request.id).then(
                              (value) => {setIsAcceptedOrDenied()},
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
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        requestDomain.deny(widget.request.id).then(
                              (value) => {setIsAcceptedOrDenied()},
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
                  ],
                ),
            ],
          ),
        ),
        const Divider(height: 5, color: AppColors.dividerColor),
      ],
    );
  }
}
