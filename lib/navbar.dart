import 'package:flutter/material.dart';
import 'package:hackathon_x_project/page/discover.dart';
import 'package:hackathon_x_project/page/home.dart';
import 'package:hackathon_x_project/page/newcalendar.dart';
import 'package:hackathon_x_project/page/userprofilepage.dart';
import 'package:hackathon_x_project/page/shop.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {

  int _page = 2;

  final pages = [
    const Newcalendar(),
    const Discover(),
    const Home(),
    const Shop(),
    const UserProfilePage(),
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
            const NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
            const NavigationDestination(icon: Icon(Icons.search), label: 'Discover'),
            NavigationDestination(icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 3.0),
              child: Image.asset('assets/gif/dog2.png'),
            ), label: 'Home'),
            const NavigationDestination(icon: Icon(Icons.shopping_bag_outlined), label: 'Shop'),
            const NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
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