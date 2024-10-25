import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector_math;

class Room3DDecorator extends StatefulWidget {
  const Room3DDecorator({super.key});

  @override
  _Room3DDecoratorState createState() => _Room3DDecoratorState();
}

class _Room3DDecoratorState extends State<Room3DDecorator> {
  double _rotationX = 0;
  double _rotationY = 0;
  final List<Furniture> _furniture = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Room Decorator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showFurnitureDialog,
          ),
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _rotationY += details.delta.dx * 0.01;
            _rotationX += details.delta.dy * 0.01;
          });
        },
        child: Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(_rotationX)
              ..rotateY(_rotationY),
            alignment: Alignment.center,
            child: SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                children: [
                  // Room walls
                  _buildWall(
                    color: Colors.grey[300]!,
                    transform: Matrix4.identity(),
                  ),
                  _buildWall(
                    color: Colors.grey[400]!,
                    transform: Matrix4.rotationY(vector_math.radians(90)),
                  ),
                  _buildWall(
                    color: Colors.grey[200]!,
                    transform: Matrix4.rotationX(vector_math.radians(90)),
                  ),
                  
                  // Furniture
                  ..._furniture.map((furniture) => _buildFurniture(furniture)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWall({
    required Color color,
    required Matrix4 transform,
  }) {
    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: Container(
        width: 300,
        height: 300,
        color: color,
      ),
    );
  }

  Widget _buildFurniture(Furniture furniture) {
    return Positioned(
      left: furniture.position.dx,
      top: furniture.position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            furniture.position += details.delta;
          });
        },
        child: Transform(
          transform: Matrix4.rotationZ(furniture.rotation),
          alignment: Alignment.center,
          child: Container(
            width: furniture.size.width,
            height: furniture.size.height,
            decoration: BoxDecoration(
              color: furniture.color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  void _showFurnitureDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Furniture'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Table'),
                onTap: () {
                  setState(() {
                    _furniture.add(
                      Furniture(
                        type: FurnitureType.table,
                        position: const Offset(100, 100),
                        size: const Size(60, 40),
                        color: Colors.brown,
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Chair'),
                onTap: () {
                  setState(() {
                    _furniture.add(
                      Furniture(
                        type: FurnitureType.chair,
                        position: const Offset(150, 150),
                        size: const Size(30, 30),
                        color: Colors.brown[700]!,
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Bed'),
                onTap: () {
                  setState(() {
                    _furniture.add(
                      Furniture(
                        type: FurnitureType.bed,
                        position: const Offset(50, 50),
                        size: const Size(100, 180),
                        color: Colors.blue[200]!,
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class Furniture {
  final FurnitureType type;
  Offset position;
  final Size size;
  final Color color;
  double rotation = 0;

  Furniture({
    required this.type,
    required this.position,
    required this.size,
    required this.color,
  });
}

enum FurnitureType {
  table,
  chair,
  bed,
}