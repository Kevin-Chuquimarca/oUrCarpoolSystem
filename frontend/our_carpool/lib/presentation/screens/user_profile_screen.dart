import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business/user_manager.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    var counter = context.read<UserManager>();
    counter.getUserData(email);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('User Profile Screen'),
            Consumer<UserManager>(
              builder: (context, userManager, child) => Column(
                children: [
                  if (userManager.profilePicture.isNotEmpty)
                    Image.memory(userManager.profilePicture),
                  Text("Name: ${userManager.user.name}"),
                  Text("Last Name: ${userManager.user.lastName}"),
                  Text("Email: ${userManager.user.email}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
