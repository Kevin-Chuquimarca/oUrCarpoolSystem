import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpStepTwoScreen extends StatefulWidget {
  const SignUpStepTwoScreen({Key? key}) : super(key: key);

  @override
  State<SignUpStepTwoScreen> createState() => _SignUpStepTwoScreenState();
}

class _SignUpStepTwoScreenState extends State<SignUpStepTwoScreen> {
  String selectedCareer = 'Software Engineering';
  final List<String> careers = [
    'Software Engineering',
    'Mechanical Engineering',
    'Electronics Engineering',
    'Biotechnology',
    'Civil Engineering',
    'Accounting',
    'Finance',
  ];

  late ImagePicker _imagePicker;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _openImagePicker() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
      // ignore: avoid_print
      print('Nombre de la imagen seleccionada: ${pickedImage.name}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                  'NAME',
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
                  'LAST NAME',
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
                  'PHONE NUMBER',
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
                  'CAREER',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4.0),
                DropdownButtonFormField<String>(
                  value: selectedCareer,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCareer = newValue!;
                    });
                  },
                  items: careers.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 35,
                    child: ElevatedButton.icon(
                      onPressed:
                          _openImagePicker, // Abrir la galería al presionar el botón
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
                  onPressed: () {},
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
    );
  }
}
