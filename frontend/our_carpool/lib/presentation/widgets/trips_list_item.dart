import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/trips_service/driver_trip_route.dart';
import 'package:our_carpool/domain/student_registration/user_domain.dart';

import '../../utils/colors.dart';
import '../screens/trip_details_screen.dart';

class TripListItem extends StatefulWidget {
  final DriverTripRoute dtr;

  const TripListItem({
    super.key,
    required this.dtr,
  });

  @override
  State<TripListItem> createState() => _TripListItemState();
}

class _TripListItemState extends State<TripListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UserDomain userDomain = UserDomain();
        userDomain.getById(widget.dtr.driver.codUser).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TripDetailsScreen(dtr: widget.dtr, user: value),
            ),
          );
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4.0),
                      Center(
                        child: Text(
                          widget.dtr.endLocation.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35),
                            child: const Icon(Icons.location_on),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'From: ${widget.dtr.startLocation.name}',
                            style: const TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35),
                            child: const Icon(Icons.calendar_today),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Date: ${widget.dtr.trip.date.toString().substring(0, 10)}',
                            style: const TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35),
                            child: const Icon(Icons.access_time),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Time: ${widget.dtr.trip.leaveHour.toString().substring(11, 16)}',
                            style: const TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35),
                            child: const Icon(Icons.person),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Free Seats: ${widget.dtr.trip.freeSeats}',
                            style: const TextStyle(fontSize: 13.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 5, color: AppColors.dividerColor),
        ],
      ),
    );
  }
}
