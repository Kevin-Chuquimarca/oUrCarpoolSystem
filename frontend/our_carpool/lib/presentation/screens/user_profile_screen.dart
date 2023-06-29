import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business/user_manager.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    var userManager = context.read<UserManager>();
    userManager.getUserData(email);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 230,
                height: 230,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: userManager.profilePicture.isNotEmpty
                    ? Image.memory(
                        userManager.profilePicture,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Text(
                          "No image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 16.0),
              Text(
                "Name: ${userManager.user.name}",
                style: const TextStyle(fontSize: 36),
              ),
              Text(
                "Last Name: ${userManager.user.lastName}",
                style: const TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 8.0),
              Text(
                "Email: ${userManager.user.email}",
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
