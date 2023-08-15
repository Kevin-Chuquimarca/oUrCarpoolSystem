import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/trip-service/driver_trip_route.dart';
import 'package:our_carpool/domain/trip-service/driver_trip_route_domain.dart';
import '../../utils/colors.dart';
import '../widgets/trips_list_item.dart';

class TripsListScreen extends StatefulWidget {
  const TripsListScreen({Key? key}) : super(key: key);

  @override
  State<TripsListScreen> createState() => _TripsListScreenState();
}

class _TripsListScreenState extends State<TripsListScreen> {
  List<DriverTripRoute> _dtr = List.empty();

  _getTripsRequests() {
    DriverTripRouteDomain driverRequestDomain = DriverTripRouteDomain();
    driverRequestDomain.get().then((value) {
      setState(() {
        _dtr = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _userManager = context.read<UserManager>();
    _getTripsRequests();
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
                itemCount: _dtr.length,
                itemBuilder: (context, index) {
                  final dtr = _dtr[index];
                  return TripListItem(dtr: dtr);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
