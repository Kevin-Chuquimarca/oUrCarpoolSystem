import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:intl/intl.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/data/model/trip-service/location.dart';
import 'package:our_carpool/domain/trip-service/driver_domain.dart';
import 'package:our_carpool/domain/trip-service/location_domain.dart';
import 'package:our_carpool/domain/trip-service/trip_location_domain.dart';
import 'package:our_carpool/presentation/screens/menu/navigation_menu_screen.dart';
import 'package:our_carpool/presentation/widgets/api_button.dart';
import 'package:provider/provider.dart';
import '../../../data/model/trip-service/trip.dart';
import '../../../data/model/university_location.dart';
import '../../../utils/colors.dart';
import '../map/map_screen.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({Key? key}) : super(key: key);

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _leaveDate = TextEditingController();
  final _leaveHour = TextEditingController();

  UniversityLocation _selectedUniversity = UniversityLocation.empty();
  List<UniversityLocation> _universities = List.empty();

  bool _isReturnRoute = false;

  String _selectedNumFreeSeats = "4";
  final _numFreeSeats = ["4", "3", "2", "1"];

  LatLng center = const LatLng(-1.8312, -78.1834);

  void setCenter(LatLng newCenter) {
    setState(() {
      center = newCenter;
    });
  }

  @override
  void initState() {
    _leaveDate.text = "";
    _universities = universitiesLocation;
    _selectedUniversity = _universities[0];
    super.initState();
  }

  @override
  void dispose() {
    _leaveDate.dispose();
    _leaveHour.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(height: 5, color: AppColors.dividerColor),
                        const SizedBox(height: 16.0),
                        const Text(
                          'DATE',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _leaveDate,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the date of the trip';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today,
                                color: AppColors.primaryColor),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                _leaveDate.text = formattedDate;
                              });
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const Text(
                          'TIME',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _leaveHour,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the time of the trip';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.access_time,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              DateTime now = DateTime(2023, 1, 1,
                                  pickedTime.hour, pickedTime.minute);
                              String formatTime =
                                  DateFormat('HH:mm').format(now);
                              setState(() {
                                _leaveHour.text = formatTime;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'AVAILABLE PLACES',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Center(
                          child: Container(
                            width: 70,
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 52,
                              child: DropdownButton<String>(
                                value: _selectedNumFreeSeats,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedNumFreeSeats = newValue!;
                                  });
                                },
                                items: _numFreeSeats
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.primaryColor,
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: AppColors.blackColor),
                                underline: Container(
                                  height: 1,
                                  color: AppColors.primaryColor,
                                ),
                                isExpanded: true,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'POINT 1',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ElevatedButton(
                              //     onPressed: () {},
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: AppColors.lightGray,
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(8),
                              //       ),
                              //       padding: const EdgeInsets.all(14),
                              //       //minimumSize: const Size(double.infinity, 0),
                              //     ),
                              //     child: const Text('Use old Location',
                              //         style: TextStyle(
                              //             color: AppColors.primaryColor))),
                              // const SizedBox(width: 16.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MapScreen(
                                          center: center, setCenter: setCenter),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.lightGray,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(14),
                                  //minimumSize: const Size(double.infinity, 0),
                                ),
                                child: const Text('Use new Location',
                                    style: TextStyle(
                                        color: AppColors.primaryColor)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'POINT 2',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 52,
                            child: DropdownButton<UniversityLocation>(
                              value: _selectedUniversity,
                              onChanged: (UniversityLocation? newValue) {
                                setState(() {
                                  _selectedUniversity = newValue!;
                                });
                              },
                              items: _universities
                                  .map<DropdownMenuItem<UniversityLocation>>(
                                      (value) {
                                return DropdownMenuItem<UniversityLocation>(
                                  value: value,
                                  child: Text(value.name),
                                );
                              }).toList(),
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style:
                                  const TextStyle(color: AppColors.blackColor),
                              underline: Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              isExpanded: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        (!_isReturnRoute)
                            ? const Text(
                                "Trip Route: From: Point 1 to: Point 2")
                            : const Text(
                                "Trip Route: From: Point 2 to: Point 1"),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isReturnRoute = !_isReturnRoute;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF111A35),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: Center(
                              child: Text(
                                'CHANGE ROUTE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: SizedBox(
                width: double.infinity,
                child: Consumer<UserManager>(
                  builder: (context, userManager, child) {
                    return APIButton(
                      textButton: 'CREATE',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TripLocationDomain tripLocationDomain =
                              TripLocationDomain();
                          LocationDomain locationDomain = LocationDomain();
                          DriverDomain driverDomain = DriverDomain();
                          final formatTime =
                              DateFormat.Hm().parse(_leaveHour.text);
                          tripLocationDomain.createTripLocation(
                              Location(
                                  id: 0,
                                  lat: center.latitude,
                                  lng: center.longitude,
                                  name: "Driver House"),
                              Trip(
                                  id: 0,
                                  idDri: userManager.user.id,
                                  idLoc: 0,
                                  leaveHour: DateTime(2023, 1, 1,
                                      formatTime.hour, formatTime.minute),
                                  date: DateTime.parse(_leaveDate.text),
                                  available: 1,
                                  freeSeats: int.parse(_selectedNumFreeSeats),
                                  typeTrip: (_isReturnRoute) ? "R" : "P"));
                          driverDomain
                              .getDriver(userManager.user.id)
                              .then((value) => {
                                    locationDomain.update(
                                        value.idLoc!,
                                        _selectedUniversity.latitude,
                                        _selectedUniversity.longitude,
                                        _selectedUniversity.name),
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavigationMenuScreen()),
                                      (route) => false,
                                    )
                                  });
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
