import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../business/user_manager.dart';
import '../widgets/driver_list_item.dart';
import '../../data/model/driver.dart';
import '../screens/driver_approval_screen.dart';
import '../../utils/colors.dart';

class AdminDriversListScreen extends StatefulWidget {
  const AdminDriversListScreen({Key? key}) : super(key: key);

  @override
  _AdminDriversListScreenState createState() => _AdminDriversListScreenState();
}

class _AdminDriversListScreenState extends State<AdminDriversListScreen> {
  late UserManager _userManager;
  List<Driver> _drivers = [
    Driver(
      id: '1',
      name: 'John Doe',
      email: 'johndoe@example.com',
      licenseType: 'Type A',
      requestDate: DateTime(2023, 7, 7),
    ),
    Driver(
      id: '2',
      name: 'Jane Smith',
      email: 'janesmith@example.com',
      licenseType: 'Type B',
      requestDate: DateTime(2023, 7, 6),
    ),
    Driver(
      id: '3',
      name: 'Alice Johnson',
      email: 'alicejohnson@example.com',
      licenseType: 'Type C',
      requestDate: DateTime(2023, 7, 5),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _userManager = context.read<UserManager>();
    // Aquí puedes obtener los datos de los conductores
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Drivers to approve',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 5, color: AppColors.dividerColor),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: lógica para ordenar los conductores
                  },
                  label: const Text(
                    'Oldest',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grayColor,
                    ),
                  ),
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: AppColors.grayColor,
                  ),
                ),
              ),
              const Divider(height: 5, color: AppColors.dividerColor),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _drivers.length,
                itemBuilder: (context, index) {
                  final driver = _drivers[index];
                  return DriverListItem(
                    driver: driver,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DriverApprovalScreen(driver: driver),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
