import 'package:flutter/material.dart';
import 'package:our_carpool/business/user_manager.dart';
import 'package:our_carpool/presentation/screens/admin_drivers_list_screen.dart';
import 'package:our_carpool/presentation/screens/user_profile_screen.dart';
import 'package:our_carpool/presentation/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class NavigationMenuScreen extends StatefulWidget {
  const NavigationMenuScreen({Key? key}) : super(key: key);

  @override
  State<NavigationMenuScreen> createState() => _NavigationMenuScreenState();
}

class _NavigationMenuScreenState extends State<NavigationMenuScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    UserProfileScreen(),
    AdminDriversListScreen(),
    Text('Help'),
  ];

  static const List<Text> _appBarTitles = <Text>[
    Text('User Profile'),
    Text('Drivers to approve'),
    Text('Help'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            ListTile(
              title: const Text('User Profile'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Drivers to approve'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Help'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(1);
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
