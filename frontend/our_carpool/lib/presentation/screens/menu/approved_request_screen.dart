import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';

import '../../../domain/driver_request_domain.dart';
import '../../../utils/colors.dart';

class ApprovedRequestScreen extends StatefulWidget {
  const ApprovedRequestScreen({Key? key}) : super(key: key);

  @override
  State<ApprovedRequestScreen> createState() => _ApprovedRequestScreenState();
}

class _ApprovedRequestScreenState extends State<ApprovedRequestScreen> {
  List<DriverRequest> _driversRequests = List.empty();

  _getDriversRequests() {
    DriverRequestDomain driverRequestDomain = DriverRequestDomain();
    driverRequestDomain.getAllApproved().then((value) {
      setState(() {
        _driversRequests = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getDriversRequests();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: _driversRequests.length,
                itemBuilder: (context, index) {
                  final driverRequest = _driversRequests[index];
                  return Column(
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
                                    'Mail: ${driverRequest.email}',
                                    style: const TextStyle(fontSize: 13.0),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Type License: ${driverRequest.typeLic}',
                                    style: const TextStyle(fontSize: 13.0),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Request Date: ${driverRequest.shippingDate.day.toString().padLeft(2, '0')} ${_getMonthName(driverRequest.shippingDate.month)} ${driverRequest.shippingDate.year}',
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
                  );
                },
              )
            ],
          ),
        ),
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
