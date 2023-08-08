import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({Key? key}) : super(key: key);

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _typeLicenseController = TextEditingController();
  final _expiryDateLicenseController = TextEditingController();
  final _expiryTimeLicenseController = TextEditingController();
  final _plateCarController = TextEditingController();

  String _selectedAvailablePlaces = "4";
  final _availablePlaces = ["4", "3", "2", "1"];

  @override
  void initState() {
    _expiryDateLicenseController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    _typeLicenseController.dispose();
    _expiryDateLicenseController.dispose();
    _plateCarController.dispose();
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
                          controller: _expiryDateLicenseController,
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
                                _expiryDateLicenseController.text =
                                    formattedDate;
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
                          controller: _expiryTimeLicenseController,
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
                              String formattedTime = pickedTime.format(context);
                              setState(() {
                                _expiryTimeLicenseController.text =
                                    formattedTime;
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
                                value: _selectedAvailablePlaces,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedAvailablePlaces = newValue!;
                                  });
                                },
                                items: _availablePlaces
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
                          'FROM',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _plateCarController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter starting location';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF111A35),
                              ),
                            ),
                            icon: Icon(
                              Icons.home_outlined,
                              size: 35,
                              color: AppColors.primaryColor,
                            ),
                            // hintText: 'ABC1234',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'TO',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _plateCarController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter destination location';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF111A35),
                              ),
                            ),
                            icon: Icon(
                              Icons.location_on_outlined,
                              size: 35,
                              color: AppColors.primaryColor,
                            ),
                            // hintText: 'ABC1234',
                          ),
                        ),
                        const SizedBox(height: 16.0),
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
                    return ElevatedButton(
                      onPressed: () {
                        // Antes estaba la lógica para crear la solicitud del conductor
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF111A35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'CREATE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
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
