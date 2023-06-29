import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business/user_manager.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late UserManager _userManager;

  @override
  void initState() {
    super.initState();
    _userManager = context.read<UserManager>();
    _userManager.getUserData(widget.email);
  }

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
