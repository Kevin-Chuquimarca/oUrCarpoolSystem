import 'package:flutter/material.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/presentation/screens/welcome_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oUr Carpool',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF111A35)),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
