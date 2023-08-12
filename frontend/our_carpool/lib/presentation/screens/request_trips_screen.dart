import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import '../../utils/colors.dart';
import '../widgets/request_trips_item.dart';

class RequestTripsScreen extends StatefulWidget {
  const RequestTripsScreen({Key? key}) : super(key: key);

  @override
  State<RequestTripsScreen> createState() => _RequestTripsScreenState();
}

class _RequestTripsScreenState extends State<RequestTripsScreen> {
  List<DriverRequest> _drivers = List.empty();

  _getDriversRequests() {
    DriverRequestDomain driverRequestDomain = DriverRequestDomain();
    driverRequestDomain.getAllPending().then((value) {
      setState(() {
        _drivers = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _userManager = context.read<UserManager>();
    _getDriversRequests();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Center(
                child: Text(
                  'Request',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Divider(height: 5, color: AppColors.dividerColor),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _drivers.length,
                itemBuilder: (context, index) {
                  final driver = _drivers[index];
                  return RequestTripsItem(driverRequest: driver);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
