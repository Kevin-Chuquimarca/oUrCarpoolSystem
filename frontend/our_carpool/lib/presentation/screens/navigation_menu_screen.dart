import 'package:flutter/material.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/domain/option_role_domain.dart';
import 'package:our_carpool/presentation/screens/admin_drivers_list_screen.dart';
import 'package:our_carpool/presentation/screens/approved_request_screen.dart';
import 'package:our_carpool/presentation/screens/create_trip_screen.dart';
import 'package:our_carpool/presentation/screens/current_trip_screen.dart';
import 'package:our_carpool/presentation/screens/driver_request_screen.dart';
import 'package:our_carpool/presentation/screens/rejected_request_screen.dart';
import 'package:our_carpool/presentation/screens/trips_screen.dart';
import 'package:our_carpool/presentation/screens/user_profile_screen.dart';
import 'package:our_carpool/presentation/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'drivers_screen.dart';

class NavigationMenuScreen extends StatefulWidget {
  const NavigationMenuScreen({Key? key}) : super(key: key);

  @override
  State<NavigationMenuScreen> createState() => _NavigationMenuScreenState();
}

class _NavigationMenuScreenState extends State<NavigationMenuScreen> {
  String _selectedIndex = 'pfl';
  List<String> _idOptions = List.empty();

  static const Map<String, Widget> _widgetOptions = <String, Widget>{
    'drv': DriversScreen(),
    'prq': AdminDriversListScreen(),
    'arq': ApprovedRequestScreen(),
    'rap': RejectedRequestScreen(),
    'bdr': DriverRequestScreen(),
    'tps': TripsScreen(),
    'crt': CurrentTripScreen(),
    'ctp': CreateTripScreen(),
    'pfl': UserProfileScreen(),
    'lgo': WelcomeScreen(),
  };

  static const Map<String, Text> _appBarTitles = <String, Text>{
    'drv': Text('Drivers'),
    'prq': Text('Pending Requests'),
    'arq': Text('Approved Requests'),
    'rap': Text('Rejected Requests'),
    'bdr': Text('Driver Request'),
    'tps': Text('Trips'),
    'crt': Text('Current Trip'),
    'ctp': Text('Create Trip'),
    'pfl': Text('Profile'),
    'lgo': Text('Log Out')
  };

  void _getOptions() async {
    OptionRoleDomain optionRoleDomain = OptionRoleDomain();
    optionRoleDomain
        .getRoleOptions(context.read<UserManager>().user.idRl)
        .then((option) => setState(() {
              _idOptions = option.map((op) => op.id).toList();
            }));
  }

  void _onItemTapped(String index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _getOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _appBarTitles[_selectedIndex]),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Consumer<UserManager>(
                builder: (context, userManager, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
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
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${userManager.user.name} ${userManager.user.lastName}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(userManager.user.email)
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            if (_idOptions.contains('drv'))
              ListTile(
                title: const Text('Drivers'),
                selected: _selectedIndex == 'drv',
                onTap: () {
                  _onItemTapped('drv');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('prq'))
              ListTile(
                title: const Text('Pending Requests'),
                selected: _selectedIndex == 'prq',
                onTap: () {
                  _onItemTapped('prq');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('arq'))
              ListTile(
                title: const Text('Approved Requests'),
                selected: _selectedIndex == 'arq',
                onTap: () {
                  _onItemTapped('arq');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('rap'))
              ListTile(
                title: const Text('Rejected Requests'),
                selected: _selectedIndex == 'rap',
                onTap: () {
                  _onItemTapped('rap');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('bdr'))
              ListTile(
                title: const Text('Driver Request'),
                selected: _selectedIndex == 'bdr',
                onTap: () {
                  _onItemTapped('bdr');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('tps'))
              ListTile(
                title: const Text('Trips'),
                selected: _selectedIndex == 'tps',
                onTap: () {
                  _onItemTapped('tps');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('crt'))
              ListTile(
                title: const Text('Current Trip'),
                selected: _selectedIndex == 'crt',
                onTap: () {
                  _onItemTapped('crt');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('ctp'))
              ListTile(
                title: const Text('Create Trip'),
                selected: _selectedIndex == 'ctp',
                onTap: () {
                  _onItemTapped('ctp');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('pfl'))
              ListTile(
                title: const Text('Profile'),
                selected: _selectedIndex == 'pfl',
                onTap: () {
                  _onItemTapped('pfl');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('lgo'))
              ListTile(
                title: const Text('Log Out'),
                selected: _selectedIndex == 'lgo',
                onTap: () {
                  _onItemTapped('lgo');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (route) => false,
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
