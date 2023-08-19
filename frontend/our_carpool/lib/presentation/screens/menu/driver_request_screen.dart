import 'dart:io';

import 'package:intl/intl.dart';
import 'package:our_carpool/presentation/screens/request_confirmation_screen.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/domain/driver_approval/driver_request_domain.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class DriverRequestScreen extends StatefulWidget {
  const DriverRequestScreen({Key? key}) : super(key: key);

  @override
  State<DriverRequestScreen> createState() => _DriverRequestScreen();
}

class _DriverRequestScreen extends State<DriverRequestScreen> {
  File? _photoLicense;
  File? _photoCar;
  static const int maxImageSize = 1024 * 1024;

  final _formKey = GlobalKey<FormState>();
  final _typeLicenseController = TextEditingController();
  final _expiryDateLicenseController = TextEditingController();
  final _plateCarController = TextEditingController();

  String _selectedTypeLic = "A";
  final _typeLicenses = ["A", "B", "C", "D"];

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

  Future<void> _openImagePickerLicense() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _photoLicense = File(pickedImage.path);
      });
    }
  }

  Future<void> _openImagePickerCar() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _photoCar = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 5, color: AppColors.dividerColor),
                  const Text('PHOTO LICENSE'),
                  Center(
                    child: _photoLicense == null
                        ? const Text(
                            "Not image selected, the max image size is 1MB")
                        : _photoLicense!.lengthSync() > maxImageSize
                            ? const Text(
                                "The image size is too big, the max image size is 1MB")
                            : Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.file(
                                  _photoLicense!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 35,
                      child: ElevatedButton.icon(
                        onPressed: _openImagePickerLicense,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF111A35),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                              color: Color(0xFF111A35),
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'Add Photo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'LICENSE TYPE',
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
                      child: DropdownButton<String>(
                        value: _selectedTypeLic,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTypeLic = newValue!;
                          });
                        },
                        items: _typeLicenses
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: AppColors.blackColor),
                        underline: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        isExpanded: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'EXPIRY DATE LICENSE',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _expiryDateLicenseController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your expiry date license';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
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
                          _expiryDateLicenseController.text = formattedDate;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  const Text('PHOTO CAR'),
                  Center(
                    child: _photoCar == null
                        ? const Text(
                            "Not image selected, the max image size is 1MB")
                        : _photoCar!.lengthSync() > maxImageSize
                            ? const Text(
                                "The image size is too big, the max image size is 1MB")
                            : Container(
                                width: 150,
                                height: 150,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.file(
                                  _photoCar!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 35,
                      child: ElevatedButton.icon(
                        onPressed: _openImagePickerCar,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF111A35),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                              color: Color(0xFF111A35),
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'Add Photo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'PLATE CAR',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _plateCarController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your plate car';
                      }
                      if (value.length > 7 || value.length < 6) {
                        return 'Please enter a valid plate car';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF111A35),
                        ),
                      ),
                      // hintText: 'ABC1234',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Consumer<UserManager>(builder: (context, userManager, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _photoCar != null &&
                            _photoCar!.lengthSync() <= maxImageSize &&
                            _photoLicense != null &&
                            _photoLicense!.lengthSync() <= maxImageSize) {
                          DriverRequestDomain driverRequestDomain =
                              DriverRequestDomain();
                          driverRequestDomain
                              .postDriverRequest(
                                  1,
                                  userManager.user.email,
                                  DateTime.now(),
                                  DateTime.now(),
                                  _selectedTypeLic,
                                  DateTime.parse(
                                      _expiryDateLicenseController.text),
                                  "${_plateCarController.text}${p.extension(_photoLicense!.path)}",
                                  _plateCarController.text,
                                  "${_plateCarController.text}${p.extension(_photoCar!.path)}",
                                  "P",
                                  "not message",
                                  _photoLicense!,
                                  _photoCar!,
                                  userManager.user.id)
                              .then((value) => {
                                    if (value)
                                      {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RequestConfirmationScreen(),
                                          ),
                                        )
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Request sent not success'),
                                          ),
                                        )
                                      }
                                  });
                        }
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
                            'SEND REQUEST',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              )),
        ),
      ),
    );
  }
}
