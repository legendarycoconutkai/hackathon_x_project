import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/colour.dart';

// Inventory widget which is a StatefulWidget
class Inventory extends StatefulWidget {
  const Inventory({super.key, required this.tabIndex, required this.onTap});
  final int tabIndex; // Index to determine which tab is selected
  final Function(int) onTap; // Callback function when an item is tapped

  @override
  State<Inventory> createState() => _InventoryState();
}

// State class for Inventory widget
class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    // Lists of item names and images for different tabs
    List<String> name0 = ["Mirror", "Shelf", "Table", "Lamp", "Sofa", "Plant"];
    List<String> image0 = [
      "assets/images/mirror.png", 
      "assets/images/shelf.png", 
      "assets/images/table.png", 
      "assets/images/lamp.png",
      "assets/images/sofa.png",
      "assets/images/plant.png"
    ];

    List<String> name1 = ["Wall 1", "Wall 2", "Wall 3", "Floor 1", "Floor 2", "Floor 3"];
    List<String> image1 = [
      "assets/images/wall1.png", 
      "assets/images/wall2.png", 
      "assets/images/wall3.png", 
      "assets/images/floor1.png",
      "assets/images/floor2.png",
      "assets/images/floor3.png"
    ];

    List<String> name2 = ["Milktea", "Noodle", "Pocky", "Biscuit", "Pretzel", "Candy"];
    List<String> image2 = [
      "assets/images/drinks.png", 
      "assets/images/food.png", 
      "assets/images/pocky.png", 
      "assets/images/biscuit.png",
      "assets/images/pretzel.png",
      "assets/images/candy.png"
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: background, // Background color from imported colour.dart
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 6, // Number of items in the grid
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              childAspectRatio: 1, // Aspect ratio of each grid item
            ),
            itemBuilder: (context, index) {
              // Switch case to determine which list of items to display based on tabIndex
              switch(widget.tabIndex) {
                case 0:
                  return ItemTile(
                    imagePath: image0[index], 
                    itemName: name0[index], 
                    index: index, 
                    onTap: widget.onTap, 
                    tabIndex: widget.tabIndex,
                  );
                case 1:
                  return ItemTile(
                    imagePath: image1[index], 
                    itemName: name1[index], 
                    index: index, 
                    onTap: widget.onTap, 
                    tabIndex: widget.tabIndex,
                  );
                case 2:
                  return ItemTile(
                    imagePath: image2[index], 
                    itemName: name2[index], 
                    index: index, 
                    onTap: widget.onTap, 
                    tabIndex: widget.tabIndex,
                  );
              }
              return null; // Return null if no case matches
            },
          ),
        ),
      )
    );
  }
}

// ItemTile widget to display individual items in the grid
class ItemTile extends StatelessWidget {
  final String imagePath; // Path to the image asset
  final String itemName; // Name of the item
  final int index; // Index of the item
  final int tabIndex; // Index of the tab
  final Function(int) onTap; // Callback function when the item is tapped

  const ItemTile({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.index,
    required this.tabIndex,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black), // Border color
          borderRadius: BorderRadius.circular(8), // Border radius
          color: Colors.white, // Background color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(index), // Call onTap with the index when tapped
              child: Image.asset(
                imagePath,
                height: 64, // Height of the image
              ),
            ),
            Text(itemName) // Display the item name
          ],
        ),
      ),
    );
  }
}