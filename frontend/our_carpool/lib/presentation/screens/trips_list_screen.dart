import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';
import 'package:our_carpool/domain/driver_request_domain.dart';
import '../../utils/colors.dart';
import '../widgets/trips_list_item.dart';

class TripsListScreen extends StatefulWidget {
  const TripsListScreen({Key? key}) : super(key: key);

  @override
  State<TripsListScreen> createState() => _TripsListScreenState();
}

class _TripsListScreenState extends State<TripsListScreen> {
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
            children: <Widget>[
              const Divider(height: 5, color: AppColors.dividerColor),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _drivers.length,
                itemBuilder: (context, index) {
                  final driver = _drivers[index];
                  return TripListItem(driverRequest: driver);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
