import 'package:flutter/material.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/presentation/screens/welcome_screen.dart';
import 'package:our_carpool/utils/colors.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        // Simula una carga inicial que podría tomar tiempo (p. ej. una verificación de inicio de sesión)
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          // Si el Future ha terminado (completado), muestra la pantalla de bienvenida
          if (snapshot.connectionState == ConnectionState.done) {
            return const WelcomeScreen();
          }
          // Mientras se carga el Future, muestra el splash screen
          return const SplashScreen();
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/background/oUrCarpoolLogo1.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),
          const Text(
            'WELCOME',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 8), // Espacio entre los textos
          const Text(
            'Loading...',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
