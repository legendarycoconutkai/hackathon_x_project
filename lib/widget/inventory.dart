import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {

  const Inventory({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {

  @override
  Widget build(BuildContext context) {

    List<String> name0 = ["One", "Two", "Three", "Four", "Five", "Six"];
    List<String> image0 = [
      "assets/images/Picture1.png", 
      "assets/images/Picture2.png", 
      "assets/images/Picture3.png", 
      "assets/images/Picture4.png",
      "assets/images/Picture5.png",
      "assets/images/Picture6.png"];

    List<String> name1 = ["Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve"];
    List<String> image1 = [
      "assets/images/Picture1.png", 
      "assets/images/Picture2.png", 
      "assets/images/Picture3.png", 
      "assets/images/Picture4.png",
      "assets/images/Picture5.png",
      "assets/images/Picture6.png"];

    List<String> name2 = ["Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen"];
    List<String> image2 = [
      "assets/images/Picture1.png", 
      "assets/images/Picture2.png", 
      "assets/images/Picture3.png", 
      "assets/images/Picture4.png",
      "assets/images/Picture5.png",
      "assets/images/Picture6.png"];

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
                  return ItemTile(imagePath: image0[index], itemName: name0[index]);
                case 1:
                  return ItemTile(imagePath: image1[index], itemName: name1[index]);
                case 2:
                  return ItemTile(imagePath: image2[index], itemName: name2[index]);
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

  const ItemTile({
    super.key,
    required this.imagePath,
    required this.itemName
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