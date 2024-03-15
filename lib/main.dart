import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/profile_screen.dart';
import 'screens/verification_screen.dart';
import 'providers/user_provider.dart';

void main() => runApp(ReneCheckAppWrapper());

class ReneCheckAppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: ReneCheckApp(),
    );
  }
}

class ReneCheckApp extends StatefulWidget {
  @override
  _ReneCheckAppState createState() => _ReneCheckAppState();
}

class _ReneCheckAppState extends State<ReneCheckApp> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    ProfileScreen(),
    VerificationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReneCheck',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: 'Verification',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
