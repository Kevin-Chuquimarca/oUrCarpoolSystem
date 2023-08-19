import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_approval/driver_request.dart';

import '../../domain/student_registration/user_domain.dart';
import '../../utils/colors.dart';
import '../screens/driver_approval_screen.dart';

class DriverListItem extends StatefulWidget {
  final DriverRequest driverRequest;

  const DriverListItem({
    super.key,
    required this.driverRequest,
  });

  @override
  State<DriverListItem> createState() => _DriverListItemState();
}

class _DriverListItemState extends State<DriverListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UserDomain userDomain = UserDomain();
        userDomain.getDataUserByEmail(widget.driverRequest.email).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DriverApprovalScreen(
                driverRequest: widget.driverRequest,
                user: value,
              ),
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
                Container(
                  width: 68,
                  height: 68,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4.0),
                      Text(
                        'Mail: ${widget.driverRequest.email}',
                        style: const TextStyle(fontSize: 13.0),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Type License: ${widget.driverRequest.typeLic}',
                        style: const TextStyle(fontSize: 13.0),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Request Date: ${widget.driverRequest.shippingDate.day.toString().padLeft(2, '0')} ${_getMonthName(widget.driverRequest.shippingDate.month)} ${widget.driverRequest.shippingDate.year}',
                        style: const TextStyle(fontSize: 13.0),
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

String _getMonthName(int month) {
  final monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return monthNames[month - 1];
}
