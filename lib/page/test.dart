import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: DraggableTest(),
  ));
}

class DraggableTest extends StatefulWidget {

  const DraggableTest({super.key});

  @override
  _DraggableTestState createState() => _DraggableTestState();
}

class _DraggableTestState extends State<DraggableTest> {
  Offset _dragOffset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _dragOffset.dx,
            top: _dragOffset.dy,
            child: DragWidget(key: UniqueKey(), onDragEnd: onDragEnd),
          ),
        ],
      ),
    );
  }

  void onDragEnd(Offset offset) {
    setState(() {
      _dragOffset += offset;
    });
  }
}

class DragWidget extends StatelessWidget {
  final void Function(Offset) onDragEnd;

  const DragWidget({required Key key, required this.onDragEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      childWhenDragging: Container(
        height: 120,
        width: 90,
        color: Colors.grey,
      ),
      feedback: Container(
        height: 120,
        width: 90,
        color: Colors.red,
      ),
      onDragEnd: (drag) {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        onDragEnd(renderBox.globalToLocal(drag.offset));
      },
      child: Container(
        height: 120,
        width: 90,
        color: Colors.black,
      ),
    );
  }
}