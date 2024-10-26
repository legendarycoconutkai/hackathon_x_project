import 'package:flutter/material.dart';

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
              padding: EdgeInsets.only(left: 9.0),
              child: Text("Discover", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Image.network("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgS2iQ9VR5X59kKxAYkGryGzsl-eXdDRstAZWoX2OJzpucba751eHNeGICtEwPDtsnu5Hf1Vl2iOJoijoxK4h9kLrotIY1HS7QL32gNrwpCC14RkFAzHnlxJRzbjwlzfmoPQQDarBioYPHxmYmEZOy4avuAoJMiYdjp3TgpA-zuimaSWnYijUrv9kJHCRc/s851/Dungeon%20Meshi%20Banner.JPG"),
            ),

          ],
        ),
      ),
    );
  }
}