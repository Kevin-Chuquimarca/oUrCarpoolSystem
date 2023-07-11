import 'package:flutter/material.dart';
import 'package:our_carpool/utils/colors.dart';
import '../../data/model/driver.dart';

class DriverListItem extends StatelessWidget {
  final Driver driver;
  final VoidCallback onTap;

  const DriverListItem({
    super.key,
    required this.driver,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  // Aquí puedes cargar la imagen de perfil del conductor
                  // usando driver.id y driver.name
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driver.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Mail: ${driver.email}',
                        style: const TextStyle(fontSize: 13.0),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Type License: ${driver.licenseType}',
                        style: const TextStyle(fontSize: 13.0),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Request Date: ${driver.requestDate.day.toString().padLeft(2, '0')} ${_getMonthName(driver.requestDate.month)} ${driver.requestDate.year}',
                        style: const TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 5, color: AppColors.dividerColor),
        ],
      ),
    );
  }
}

String _getMonthName(int month) {
  final monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return monthNames[month - 1];
}
