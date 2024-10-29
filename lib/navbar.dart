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
  String path = 'assets/gif/sleepdog.gif';

  final pages = [
    const Newcalendar(),
    const Discover(),
    const Home(),
    const Shop(),
    UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.transparent, fontSize: 0)),
          backgroundColor: Colors.black,
          indicatorColor: Colors.grey,
        ),
        child: NavigationBar(
          height: 60,
          destinations: [
            const NavigationDestination(icon: Icon(Icons.calendar_month_outlined, color: Colors.white,), label: 'Calendar'),
            const NavigationDestination(icon: Icon(Icons.search, color: Colors.white,), label: 'Discover'),
            NavigationDestination(icon: Padding(
              padding: const EdgeInsets.only(bottom: 6.0, top: 6.0),
              child: Image.asset(path),
            ), label: 'Home'),
            const NavigationDestination(icon: Icon(Icons.shopping_bag_outlined, color: Colors.white,), label: 'Shop'),
            const NavigationDestination(icon: Icon(Icons.person_outline, color: Colors.white,), label: 'Profile'),
          ],
          selectedIndex: _page,
          onDestinationSelected: (int index) {
            setState(() {
                switch(index){
                  case 0:
                    path = 'assets/gif/laptopdog.gif';
                    break;
                  case 1:
                    path = 'assets/gif/happydog.gif';
                    break;
                  case 2:
                    path = 'assets/gif/sleepdog.gif';
                    break;
                  case 3:
                    path = 'assets/gif/comedog.gif';
                    break;
                  case 4:
                    path = 'assets/gif/winddog.gif';
                    break;
                }
                _page = index;
            });
          }
        ),
      ),
    );
  }
}