import 'package:flutter/material.dart';

class ToolsContainer extends StatelessWidget {
  const ToolsContainer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {

    List<String> name = ["Meditate", "Story", "Music", "Podcast", "Exercise"];
    List<String> image = [
      "assets/images/meditate.png", 
      "assets/images/story.png", 
      "assets/images/music.png", 
      "assets/images/podcast.png", 
      "assets/images/exercise.png"];

    return GestureDetector(
      onTap: () {
        // open search bar
      },
      child: Container(
        height: MediaQuery.of(context).size.width*0.9*25/97,
        width: MediaQuery.of(context).size.width*0.9,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(
          bottom: 30
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(image[index]),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 42.0),
          child: Text(
            name[index], 
            style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white, 
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}