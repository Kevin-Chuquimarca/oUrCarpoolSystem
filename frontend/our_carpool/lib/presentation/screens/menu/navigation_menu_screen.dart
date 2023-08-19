import 'package:flutter/material.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/domain/student_registration/option_role_domain.dart';
import 'package:our_carpool/presentation/screens/menu/admin_drivers_list_screen.dart';
import 'package:our_carpool/presentation/screens/menu/approved_request_screen.dart';
import 'package:our_carpool/presentation/screens/menu/create_trip_screen.dart';
import 'package:our_carpool/presentation/screens/menu/driver_request_screen.dart';
import 'package:our_carpool/presentation/screens/menu/no_trips_screen.dart';
import 'package:our_carpool/presentation/screens/menu/rejected_request_screen.dart';
import 'package:our_carpool/presentation/screens/menu/trips_list_screen.dart';
import 'package:our_carpool/presentation/screens/menu/user_profile_screen.dart';
import 'package:our_carpool/presentation/screens/menu/welcome_screen.dart';
import 'package:provider/provider.dart';

class NavigationMenuScreen extends StatefulWidget {
  const NavigationMenuScreen({Key? key}) : super(key: key);

  @override
  State<NavigationMenuScreen> createState() => _NavigationMenuScreenState();
}

class _NavigationMenuScreenState extends State<NavigationMenuScreen> {
  String _selectedIndex = 'pfl';
  List<String> _idOptions = List.empty();

  static const Map<String, Widget> _widgetOptions = <String, Widget>{
    'prq': AdminDriversListScreen(),
    'arq': ApprovedRequestScreen(),
    'rap': RejectedRequestScreen(),
    //'smt': ShowMyTripsScreen(),
    'bdr': DriverRequestScreen(),
    'tps': TripsListScreen(),
    'crt': NoTrips(),
    'ctp': CreateTripScreen(),
    'pfl': UserProfileScreen(),
    'lgo': WelcomeScreen(),
  };

  static const Map<String, Text> _appBarTitles = <String, Text>{
    'prq': Text('Pending Requests'),
    'arq': Text('Approved Requests'),
    'rap': Text('Rejected Requests'),
    //'smt': Text('Show my Trips'),
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
            if (_idOptions.contains('prq'))
              ListTile(
                leading: const Icon(Icons.format_list_bulleted),
                title: const Text('Pending Requests'),
                selected: _selectedIndex == 'prq',
                onTap: () {
                  _onItemTapped('prq');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('arq'))
              ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: const Text('Approved Requests'),
                selected: _selectedIndex == 'arq',
                onTap: () {
                  _onItemTapped('arq');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('rap'))
              ListTile(
                leading: const Icon(Icons.block_flipped),
                title: const Text('Rejected Requests'),
                selected: _selectedIndex == 'rap',
                onTap: () {
                  _onItemTapped('rap');
                  Navigator.pop(context);
                },
              ),
            // if (_idOptions.contains('smt'))
            //   ListTile(
            //     leading: const Icon(Icons.format_list_bulleted),
            //     title: const Text('Show my Trips'),
            //     selected: _selectedIndex == 'smt',
            //     onTap: () {
            //       _onItemTapped('smt');
            //       Navigator.pop(context);
            //     },
            //   ),
            if (_idOptions.contains('bdr'))
              ListTile(
                leading: const Icon(Icons.feed),
                title: const Text('Driver Request'),
                selected: _selectedIndex == 'bdr',
                onTap: () {
                  _onItemTapped('bdr');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('tps'))
              ListTile(
                leading: const Icon(Icons.directions_car),
                title: const Text('Trips'),
                selected: _selectedIndex == 'tps',
                onTap: () {
                  _onItemTapped('tps');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('crt'))
              ListTile(
                leading: const Icon(Icons.place),
                title: const Text('Current Trip'),
                selected: _selectedIndex == 'crt',
                onTap: () {
                  _onItemTapped('crt');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('ctp'))
              ListTile(
                leading: const Icon(Icons.verified),
                title: const Text('Create Trip'),
                selected: _selectedIndex == 'ctp',
                onTap: () {
                  _onItemTapped('ctp');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('pfl'))
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                selected: _selectedIndex == 'pfl',
                onTap: () {
                  _onItemTapped('pfl');
                  Navigator.pop(context);
                },
              ),
            if (_idOptions.contains('lgo'))
              ListTile(
                leading: const Icon(Icons.logout),
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
