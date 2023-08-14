import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

class TripScreen extends StatefulWidget {
  const TripScreen({Key? key}) : super(key: key);
  @override
  State<TripScreen> createState() => _TripScreen();
}

class _TripScreen extends State<TripScreen> {
  late GoogleMapController mapController;
  late List<LatLng> polylineCoordinates = [];
  late LatLngBounds bounds;

  @override
  void initState() {
    super.initState();
    _getDirections();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.moveCamera(
        CameraUpdate.newLatLngBounds(bounds, 100)); // 100 is padding
  }

  Future<void> _getDirections() async {
    String apiKey = 'AIzaSyBHVK4JKaJLYO6mekiA-CXD7Emg14j2Vxo';
    LatLng origin = const LatLng(0.326233, -78.129720);
    LatLng destination = const LatLng(0.343251, -78.125521);
    LatLng waypoint1 = const LatLng(0.338639, -78.129756);
    LatLng waypoint2 = const LatLng(0.342851, -78.123332);

    List<LatLng> allCoordinates = [origin, destination, waypoint1, waypoint2];

    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLng = double.infinity;
    double maxLng = -double.infinity;

    for (LatLng coordinate in allCoordinates) {
      minLat = math.min(minLat, coordinate.latitude);
      maxLat = math.max(maxLat, coordinate.latitude);
      minLng = math.min(minLng, coordinate.longitude);
      maxLng = math.max(maxLng, coordinate.longitude);
    }

    bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    String url = 'https://maps.googleapis.com/maps/api/directions/json?'
        'origin=${origin.latitude},${origin.longitude}&'
        'destination=${destination.latitude},${destination.longitude}&'
        'waypoints=via:${waypoint1.latitude},${waypoint1.longitude}|'
        'via:${waypoint2.latitude},${waypoint2.longitude}&'
        'key=$apiKey';

    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    List<LatLng> points =
        _decodePolyline(data['routes'][0]['overview_polyline']['points']);

    setState(() {
      polylineCoordinates = points;
    });
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      lat += ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      lng += ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));

      poly.add(LatLng((lat / 1E5), (lng / 1E5)));
    }
    return poly;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0.326233, -78.129720),
          zoom: 12,
        ),
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            color: Colors.blue,
            points: polylineCoordinates,
          ),
        },
        markers: {
          const Marker(
            markerId: MarkerId('origin'),
            position: LatLng(0.326233, -78.129720),
          ),
          const Marker(
            markerId: MarkerId('waypoint1'),
            position: LatLng(0.338639, -78.129756),
          ),
          const Marker(
            markerId: MarkerId('waypoint2'),
            position: LatLng(0.342851, -78.123332),
          ),
          const Marker(
            markerId: MarkerId('destination'),
            position: LatLng(0.343251, -78.125521),
          ),
        },
      ),
    );
  }
}
