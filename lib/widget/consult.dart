import 'package:flutter/material.dart';

// A stateless widget that represents a consult item
class Consult extends StatelessWidget {
  // Constructor with a required index parameter
  const Consult({super.key, required this.index});

  // Index of the consult item
  final int index;

  @override
  Widget build(BuildContext context) {
    // List of consult names
    List<String> name = ["Buddy", "Counsellor", "Psychologist", "Psychiatrist"];
    // List of image paths corresponding to the consult names
    List<String> image = [
      "assets/images/45.png", 
      "assets/images/46.png", 
      "assets/images/47.png", 
      "assets/images/48.png", 
    ];

    return Container(
      height: 165,
      width: 120,
      margin: EdgeInsets.only(
        left: index == 0 ? 0 : 12, // Add margin only if index is not 0
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Rounded corners
        color: Colors.white, // Background color
      ),
      padding: const EdgeInsets.all(9), // Padding inside the container
      child: Column(
        children: [
          // Display the image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(fit: BoxFit.cover, image[index]),
          ),
          const SizedBox(height: 6), // Spacing between image and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container for additional information (currently empty)
              Container(
                height: 17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: const Center(
                  child: Text(
                    " ", 
                    style: TextStyle(
                      color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Placeholder for an icon (commented out)
              // const Icon(Icons.new_label_outlined, color: Colors.white, size: 16),                              
            ],
          ),
          const SizedBox(width: 6), // Spacing between rows
          Row(
            children: [
              // Display the name of the consult item
              Text(
                name[index], 
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                style: const TextStyle(
                  color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}