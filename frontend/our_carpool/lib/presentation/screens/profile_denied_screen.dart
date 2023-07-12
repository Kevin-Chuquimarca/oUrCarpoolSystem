import 'package:flutter/material.dart';
import 'package:our_carpool/utils/colors.dart';

class ProfileDeniedScreen extends StatelessWidget {
  const ProfileDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cancel,
              color: AppColors.redColor,
              size: 240,
            ),
            SizedBox(height: 16),
            Text(
              'PROFILE DENIED',
              style: TextStyle(fontSize: 40, color: AppColors.redColor),
            ),
          ],
        ),
      ),
    );
  }
}
