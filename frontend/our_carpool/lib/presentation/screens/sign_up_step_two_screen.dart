import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_carpool/domain/user_domain.dart';
import 'package:our_carpool/presentation/screens/welcome_screen.dart';

import '../../utils/validators.dart';

class SignUpStepTwoScreen extends StatefulWidget {
  const SignUpStepTwoScreen(
      {super.key, required this.idUni, required this.email});

  final int idUni;
  final String email;

  @override
  State<SignUpStepTwoScreen> createState() => _SignUpStepTwoScreenState();
}

class _SignUpStepTwoScreenState extends State<SignUpStepTwoScreen> {
  File? _selectedImage;

  final _formKey = GlobalKey<FormState>();
  final _ciController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _careerController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _ciController.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _careerController.dispose();
    super.dispose();
  }

  Future<void> _openImagePicker() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    'IDENTIFICATION NUMBER',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _ciController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your identification number';
                      }
                      if (!isValidCI(_ciController.text)) {
                        return 'Please enter a valid identification number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF111A35),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'NAME',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF111A35),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'LAST NAME',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF111A35),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'PHONE NUMBER',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!isValidPhoneNumber(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF111A35),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'CAREER',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _careerController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your career';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF111A35),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: (_selectedImage != null)
                        ? Container(
                            width: 150,
                            height: 150,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ))
                        : const Text("Not image selected"),
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 35,
                      child: ElevatedButton.icon(
                        onPressed: _openImagePicker,
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
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _selectedImage != null) {
                        UserDomain userDomain = UserDomain();
                        userDomain
                            .registerNewUser(
                                widget.idUni,
                                _ciController.text,
                                widget.email,
                                _nameController.text,
                                _lastNameController.text,
                                _phoneController.text,
                                "${_ciController.text}${p.extension(_selectedImage!.path)}",
                                _careerController.text,
                                _selectedImage!)
                            .then((value) => {
                                  if (value)
                                    {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WelcomeScreen()),
                                        (route) => false,
                                      )
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Failed to register user'),
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
                          'SIGN UP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  RichText(
                    text: const TextSpan(
                      text: "By signing up, you agree to oUr Carpool's ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Terms of Service and Privacy Policy',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
