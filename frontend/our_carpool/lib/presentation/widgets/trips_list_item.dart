import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';

import '../../utils/colors.dart';
import '../screens/driver_approval_screen.dart';

class TripListItem extends StatefulWidget {
  final DriverRequest driverRequest;

  const TripListItem({
    super.key,
    required this.driverRequest,
  });

  @override
  State<TripListItem> createState() => _TripListItemState();
}

class _TripListItemState extends State<TripListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DriverApprovalScreen(
        //       driver: widget.driverRequest,
        //     ),
        //   ),
        // );
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
                      const Center(
                        child: Text(
                          'To: Universidad de las Fuerzas Armadas ESPE',
                          style: TextStyle(
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
                          const Text(
                            'From: Place ID',
                            style: TextStyle(fontSize: 13.0),
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
                          const Text(
                            'Date: Date',
                            style: TextStyle(fontSize: 13.0),
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
                          const Text(
                            'Time: Time',
                            style: TextStyle(fontSize: 13.0),
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
                          const Text(
                            'Free Seats: Available Seats',
                            style: TextStyle(fontSize: 13.0),
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
