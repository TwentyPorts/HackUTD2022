import 'package:flutter/material.dart';
import 'package:smol_biz/business-screen.dart';
import 'package:smol_biz/home-screen.dart';
import 'package:smol_biz/camera.dart';
import 'package:smol_biz/profile.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // const MyApp({super.key});

  int _selectedIndex = 1; //New

  static List<Widget> _widgetOptions = [CameraScreen(), HomeScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
    _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assistant_navigation),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xffCC66C2),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}