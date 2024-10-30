import 'package:flutter/material.dart';
import 'package:hackathon_x_project/widget/discover_tools_container.dart';

// Main Discover widget which is a StatefulWidget
class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

// State class for Discover widget
class _DiscoverState extends State<Discover> {

  // Boolean to track if the letter is open
  bool isLetterOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Main content of the page
            ListView(
              children: [
                // Top row with mail and search icons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.mail_outline),
                        onPressed: () {
                          // open menu
                        },
                      ),
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
                // Discover title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                  child: Text("Discover", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                ),
                const SizedBox(height: 9),
                // Banner image that opens the letter when tapped
                GestureDetector(
                  child: const Image(
                    image: AssetImage("assets/images/letterbanner.png"),
                  ),
                  onTap: () {
                    setState (() {
                      isLetterOpen = true;
                    });
                  },
                ),
                const SizedBox(height: 18),
                // Tools section title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                  child: Text("Tools", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                ),
                const SizedBox(height: 18),
                // List of tools
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ToolsContainer(index: index);
                    },
                  ),
                ),
              ],
            ),
            // Overlay when the letter is open
            isLetterOpen 
            ? Stack(
              children: [
                // Dark overlay background
                GestureDetector(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  onTap: () => setState(() {
                    isLetterOpen = false;
                  }),
                ),
                // Centered letter image
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9.0),
                    child: Image(image: AssetImage("assets/images/letter.png")),
                  )
                ),
              ],
            ) 
            : Container(),
          ],
        )
      ),
    );
  }
}