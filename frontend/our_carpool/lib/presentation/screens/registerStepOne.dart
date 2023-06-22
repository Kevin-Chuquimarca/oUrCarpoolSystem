import 'package:flutter/material.dart';

class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({Key? key}) : super(key: key);

  @override
  _RegisterStepOneState createState() => _RegisterStepOneState();
}

class _RegisterStepOneState extends State<RegisterStepOne> {
  String selectedUniversity = 'ESPE';
  final List<String> universities = [
    'ESPE',
    'UCE',
    'PUCE',
    'Salesiana',
    'UTE',
    'UDLA',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  child: DropdownButton<String>(
                    value: selectedUniversity,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedUniversity = newValue!;
                      });
                    },
                    items: universities
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
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
                  // Acción para NEXT button
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
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Acción para iniciar sesión con Google
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(double.infinity, 52),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset(
                        'assets/images/google_logo.png',
                      ),
                    ),
                  ),
                  label: const Text(
                    'Sign In with Google',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
