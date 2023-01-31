import "package:flutter/material.dart";

Color color = Colors.orange;
final showDraggable = color == Colors.orange;

class ScrumBoardItem extends StatelessWidget {
  const ScrumBoardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable<Color>(
      data: color,
      feedback: Container(
        color: Colors.green,
        width: 150,
        height: 50,
      ),
      child: Container(
        width: 150,
        height: 50,
        decoration: const BoxDecoration(color: Colors.blue),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: const [Text("Task 1")],
        ),
      ),
    );
  }
}
