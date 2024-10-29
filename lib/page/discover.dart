import 'package:flutter/material.dart';
import 'package:hackathon_x_project/widget/discover_tools_container.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  bool isLetterOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
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
                          //open search bar
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 9),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                  child: Text("Discover", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                ),
                const SizedBox(height: 9),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                  child: Text("Tools", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                ),
                const SizedBox(height: 18),
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
            isLetterOpen 
            ? Stack(
              children: [
                GestureDetector(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  onTap: () => setState(() {
                    isLetterOpen = false;
                  }),
                ),
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