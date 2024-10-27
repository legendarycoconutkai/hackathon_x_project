import 'package:flutter/material.dart';
import 'package:hackathon_x_project/widget/discover_tools_container.dart';

class Discover extends StatelessWidget {

  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
              child: Text("Discover", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
            ),
            const SizedBox(height: 9),
            IconButton(
              icon: Image.network("https://static.vecteezy.com/system/resources/thumbnails/005/720/479/small/banner-abstract-background-board-for-text-and-message-design-modern-free-vector.jpg"),
              padding: EdgeInsets.zero,
              onPressed: () {
                // open search bar
              }, 
            ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text("Tools", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
            ),
            const SizedBox(height: 9),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
        )
      ),
    );
  }
}