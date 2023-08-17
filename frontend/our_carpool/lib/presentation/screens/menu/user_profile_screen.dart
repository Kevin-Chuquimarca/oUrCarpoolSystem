import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../business/user_manager.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Consumer<UserManager>(
            builder: (context, userManager, child) {
              return Column(
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
                    userManager.user.name,
                    style: const TextStyle(fontSize: 36),
                  ),
                  Text(
                    userManager.user.lastName,
                    style: const TextStyle(fontSize: 36),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    userManager.user.email,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
