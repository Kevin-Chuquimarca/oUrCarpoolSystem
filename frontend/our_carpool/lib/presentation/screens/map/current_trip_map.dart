import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../utils/colors.dart';

class CurrentTripMap extends StatefulWidget {
  final LatLng center;
  final Function(LatLng) setCenter;

  const CurrentTripMap(
      {Key? key, required this.center, required this.setCenter})
      : super(key: key);

  @override
  State<CurrentTripMap> createState() => _CurrentTripMapState();
}

class _CurrentTripMapState extends State<CurrentTripMap> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(-1.8312, -78.1834);

  Marker _marker = const Marker(
    markerId: MarkerId('my_location_marker'),
    position: LatLng(0, 0),
    draggable: true,
  );

  TextEditingController controller = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    setState(() {
      _center = LatLng(locationData.latitude!, locationData.longitude!);
      _marker = _marker.copyWith(positionParam: _center);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 7.0,
        ),
        markers: {
          _marker,
        },
        onTap: (LatLng latLng) {
          setState(() {
            _center = latLng;
            _marker = _marker.copyWith(positionParam: _center);
          });
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: ElevatedButton(
              onPressed: () {
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _center,
                      zoom: 15.0,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                height: 52,
                child: Center(
                  child: Text(
                    'CENTER LOCATION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const TripFinishedScreen(),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                height: 52,
                child: Center(
                  child: Text(
                    'FINISH TRIP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
