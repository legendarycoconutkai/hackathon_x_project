import 'package:flutter/material.dart';

// A stateless widget that displays a container with an image and text.
class ToolsContainer extends StatelessWidget {
  const ToolsContainer({
    super.key,
    required this.index,
  });

  // Index to determine which tool to display.
  final int index;

  @override
  Widget build(BuildContext context) {

    // List of tool names.
    List<String> name = ["Meditate", "Story", "Music", "Podcast", "Exercise"];
    
    // List of image paths corresponding to the tools.
    List<String> image = [
      "assets/images/meditate.png", 
      "assets/images/story.png", 
      "assets/images/music.png", 
      "assets/images/podcast.png", 
      "assets/images/exercise.png"
    ];

    return GestureDetector(
      onTap: () {
        // Action to perform when the container is tapped.
        // Currently, it is set to open the search bar.
      },
      child: Container(
        // Set the height and width of the container based on the screen size.
        height: MediaQuery.of(context).size.width * 0.9 * 25 / 97,
        width: MediaQuery.of(context).size.width * 0.9,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          // Rounded corners for the container.
          borderRadius: BorderRadius.circular(15),
          // Set the background image of the container.
          image: DecorationImage(
            image: AssetImage(image[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 42.0),
          child: Text(
            // Display the name of the tool.
            name[index], 
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}