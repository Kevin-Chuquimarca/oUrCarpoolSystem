import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/university.dart';
import 'package:our_carpool/domain/university_domain.dart';
import 'package:our_carpool/presentation/screens/sign_up_step_two_screen.dart';
import 'package:our_carpool/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  University _selectedUniversity = University.empty();
  List<University> _universities = List.empty();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  _getUniversities() {
    UniversityDomain universityDomain = UniversityDomain();
    universityDomain.getUniversities().then((value) {
      setState(() {
        _universities = value;
        _selectedUniversity = value[0];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUniversities();
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
                    'INSTITUTIONAL MAIL',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!isValidEmailInstitutional(_emailController.text,
                          _selectedUniversity.emailDomain)) {
                        return 'Please enter your university email';
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
                    'UNIVERSITY',
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
                      child: DropdownButton<University>(
                        value: _selectedUniversity,
                        onChanged: (University? newValue) {
                          setState(() {
                            _selectedUniversity = newValue!;
                          });
                        },
                        items: _universities
                            .map<DropdownMenuItem<University>>((value) {
                          return DropdownMenuItem<University>(
                            value: value,
                            child: Text(value.name),
                          );
                        }).toList(),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        isExpanded: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpStepTwoScreen(
                                  idUni: _selectedUniversity.id,
                                  email: _emailController.text)),
                        );
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
                          'NEXT',
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
    );
  }
}
