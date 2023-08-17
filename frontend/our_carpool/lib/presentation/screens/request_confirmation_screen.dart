import 'package:flutter/material.dart';

import 'menu/navigation_menu_screen.dart';

class RequestConfirmationScreen extends StatelessWidget {
  const RequestConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.send,
              color: Color(0xFF111A35),
              size: 240,
            ),
            const SizedBox(height: 16),
            const Text(
              'REQUEST',
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF111A35),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'SENDED',
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF111A35),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'We are verifying your information...',
              style: TextStyle(
                  color: Color(0xFF111A35), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationMenuScreen(),
                  ),
                  (route) => false,
                );
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
                    'CONTINUE',
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
    );
  }
}
