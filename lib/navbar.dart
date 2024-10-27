import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackathon_x_project/page/discover.dart';
import 'package:hackathon_x_project/page/home.dart';
import 'package:hackathon_x_project/page/newcalendar.dart';
import 'package:hackathon_x_project/page/profile.dart';
import 'package:hackathon_x_project/page/shop.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {

  int _page = 0;

  final pages = [
    const Home(),
    const Newcalendar(),
    const Profile(),
    const Shop(),
    const Discover(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.transparent, fontSize: 0)),
          backgroundColor: Colors.white,
        ),
        child: NavigationBar(
          height: 60,
          destinations: [
            NavigationDestination(icon: Image.asset('assets/gif/dog1.gif'), label: 'Home'),
            const NavigationDestination(icon: Icon(Icons.calendar_today), label: 'Calendar'),
            const NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            const NavigationDestination(icon: Icon(Icons.person), label: 'Shop'),
            const NavigationDestination(icon: Icon(Icons.search), label: 'Discover'),
          ],
          selectedIndex: _page,
          onDestinationSelected: (int index) {
            setState(() {
                _page = index;
            });
          }
        ),
      ),
    );
  }
}