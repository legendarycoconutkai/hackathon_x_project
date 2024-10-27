import 'package:flutter/material.dart';
import 'package:hackathon_x_project/widget/popular_shop_container.dart';
import 'package:hackathon_x_project/widget/shop_event_container.dart';

class Shop extends StatelessWidget {

  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      // open menu
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      //open search bar
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 9),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text("Shop", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
            ),
            const SizedBox(height: 9),
            GestureDetector(
              child: const Image(image: AssetImage("assets/images/toystory_banner.png")),
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text("Event", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
            ),
            const SizedBox(height: 9),
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
            const SizedBox(height: 9),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text("Popular", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
            ),
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
                    childAspectRatio: 0.7,
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