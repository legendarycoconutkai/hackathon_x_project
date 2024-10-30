import 'package:flutter/material.dart';
import 'package:hackathon_x_project/widget/popular_shop_container.dart';
import 'package:hackathon_x_project/widget/shop_event_container.dart';

// Main Shop class which is a stateless widget
class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea ensures the content is within the safe area of the device
      body: SafeArea(
        child: ListView(
          children: [
            // Padding for the top row containing menu and search icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Menu icon button
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // open menu
                    },
                  ),
                  // Search icon button
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // open search bar
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 9),
            // Shop title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text(
                "Shop",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 9),
            // Banner image
            GestureDetector(
              child: const Image(image: AssetImage("assets/images/toystory_banner.png")),
            ),
            const SizedBox(height: 18),
            // Event section title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text(
                "Event",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 9),
            // Horizontal list of events
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                height: 165,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return EventContainer(index: index);
                  },
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Popular section title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text(
                "Popular",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 9),
            // Grid of popular items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return PopularContainer(index: index);
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}