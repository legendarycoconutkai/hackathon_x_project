import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.calendar_month, size: 30, color: Colors.white),
          Icon(Icons.room, size: 30, color: Colors.white),
          Icon(Icons.shop, size: 30, color: Colors.white),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 450),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}