import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ItemTile(
                imagePath: 'assets/images/Picture1.png',
                itemName: 'Food',
              ),
              ItemTile(
                imagePath: 'assets/images/Picture2.png',
                itemName: 'Wood',
              ),
              ItemTile(
                imagePath: 'assets/images/Picture3.png',
                itemName: 'Stone',
              ),
              ItemTile(
                imagePath: 'assets/images/Picture4.png',
                itemName: 'Food',
              ),
              ItemTile(
                imagePath: 'assets/images/Picture5.png',
                itemName: 'Wood',
              ),
              ItemTile(
                imagePath: 'assets/images/Picture6.png',
                itemName: 'Stone',
              ),
            ],
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