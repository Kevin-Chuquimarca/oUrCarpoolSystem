import 'package:flutter/material.dart';
import '../../data/model/driver.dart';

class DriverApprovalScreen extends StatelessWidget {
  final Driver driver;

  const DriverApprovalScreen({required this.driver});

  @override
  Widget build(BuildContext context) {
    // Implementación de la pantalla de aceptación de conductores
    // Puedes acceder a la propiedad `driver` para obtener los detalles del conductor
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Approval'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Driver Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text('Name: ${driver.name}'),
            Text('Email: ${driver.email}'),
            // Otros detalles del conductor que desees mostrar
          ],
        ),
      ),
    );
  }
}
