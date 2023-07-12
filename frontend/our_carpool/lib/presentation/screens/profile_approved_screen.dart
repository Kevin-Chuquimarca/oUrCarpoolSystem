import 'package:flutter/material.dart';
import 'package:our_carpool/utils/colors.dart';

class ProfileApprovedScreen extends StatelessWidget {
  const ProfileApprovedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: AppColors.greenColor,
              size: 240,
            ),
            SizedBox(height: 16),
            Text(
              'PROFILE APPROVED',
              style: TextStyle(fontSize: 40, color: AppColors.greenColor),
            ),
          ],
        ),
      ),
    );
  }
}
