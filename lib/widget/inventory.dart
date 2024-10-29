import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {

  const Inventory({super.key, required this.tabIndex, required this.onTap});
  final int tabIndex;
  final Function(int) onTap;

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {

  @override
  Widget build(BuildContext context) {

    List<String> name0 = ["Mirror", "Shelf", "Table", "Lamp", "Sofa", "Plant"];
    List<String> image0 = [
      "assets/images/mirror.png", 
      "assets/images/shelf.png", 
      "assets/images/table.png", 
      "assets/images/lamp.png",
      "assets/images/sofa.png",
      "assets/images/plant.png"];

    List<String> name1 = ["Wall 1", "Wall 2", "Wall 3", "Floor 1", "Floor 2", "Floor 3"];
    List<String> image1 = [
      "assets/images/wall1.png", 
      "assets/images/wall2.png", 
      "assets/images/wall3.png", 
      "assets/images/floor1.png",
      "assets/images/floor2.png",
      "assets/images/floor3.png"];

    List<String> name2 = ["Milktea", "Noodle", "Pocky", "Biscuit", "Pretzel", "Candy"];
    List<String> image2 = [
      "assets/images/drinks.png", 
      "assets/images/food.png", 
      "assets/images/pocky.png", 
      "assets/images/biscuit.png",
      "assets/images/pretzel.png",
      "assets/images/candy.png"];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              switch(widget.tabIndex) {
                case 0:
                  return ItemTile(imagePath: image0[index], itemName: name0[index], isFurniture: true, index: index, onTap: widget.onTap,);
                case 1:
                  return ItemTile(imagePath: image1[index], itemName: name1[index], isFurniture: false, index: index, onTap: widget.onTap,);
                case 2:
                  return ItemTile(imagePath: image2[index], itemName: name2[index], isFurniture: false, index: index, onTap: widget.onTap,);
              }
              return null;               
            },
          ),
        ),
      )
    );
  }
}

class ItemTile extends StatelessWidget {

  final String imagePath;
  final String itemName;
  final bool isFurniture;
  final int index;
  final Function(int) onTap;

  const ItemTile({
    super.key,
    required this.imagePath,
    required this.itemName,
    required this.isFurniture,
    required this.index,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isFurniture ?
            GestureDetector(
              onTap: () => onTap(index),
              child: Image.asset(
              imagePath,
              height: 64),
            ) :
            Image.asset(
              imagePath,
              height: 64),
            Text(itemName)
          ],
        ),
      ),
    );
  }
}