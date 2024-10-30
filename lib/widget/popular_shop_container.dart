import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/colour.dart';

// A stateless widget that represents a popular shop container
class PopularContainer extends StatelessWidget {
  // Constructor with a required index parameter
  const PopularContainer({super.key, required this.index});

  // Index of the shop to display
  final int index;

  @override
  Widget build(BuildContext context) {
    // List of shop names
    List<String> name = ["Modern1", "Modern2", "Modern3", "Modern4"];
    // List of shop images
    List<String> image = [
      "assets/images/shop1.png",
      "assets/images/shop2.png",
      "assets/images/shop3.png",
      "assets/images/shop4.png",
    ];

    return Container(
      // Container decoration with rounded corners and primary color
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primary,
      ),
      padding: const EdgeInsets.all(9),
      child: Column(
        children: [
          // Display the shop image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(fit: BoxFit.cover, image[index]),
          ),
          const SizedBox(height: 6),
          // Row containing a label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container for the "Room" label
              Container(
                height: 17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: const Center(
                  child: Text(
                    "Room",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // const Icon(Icons.new_label_outlined, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(width: 6),
          // Row containing the shop name
          Row(
            children: [
              Text(
                name[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}