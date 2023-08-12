import 'package:flutter/material.dart';
import 'package:our_carpool/data/model/driver_request.dart';
import '../../utils/colors.dart';

class RequestTripsItem extends StatefulWidget {
  final DriverRequest driverRequest;

  const RequestTripsItem({
    super.key,
    required this.driverRequest,
  });

  @override
  State<RequestTripsItem> createState() => _RequestTripsItemState();
}

class _RequestTripsItemState extends State<RequestTripsItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Column for profile photo
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: ClipOval(
                        // child: Image.network(
                        //   user.photo,
                        //   fit: BoxFit.cover,
                        //   errorBuilder: (BuildContext context, Object exception,
                        //       StackTrace? stackTrace) {
                        //     // Mostrar el fondo gris en caso de error de carga
                        //     return Container(
                        //       color: Colors.grey,
                        //     );
                        //   },
                        // ),
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Column for passenger info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name: Marco Iza',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Phone: 0984228239', // Use the correct field for passenger phone
                      style: const TextStyle(fontSize: 13.0),
                    ),
                    const Text(
                      'Request Date: 07 August 2023', // Use the correct field
                      style: TextStyle(fontSize: 13.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Column for buttons
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Handle ACCEPT button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'ACCEPT',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Handle DENY button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'DENY',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 5, color: AppColors.dividerColor),
      ],
    );
  }
}
