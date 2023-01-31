import 'package:flutter/material.dart';
import 'package:scrum_board/scrum_board_item.dart';

class ScrumBoardColumn extends StatefulWidget {
  final String header;
  const ScrumBoardColumn({super.key, required this.header});

  @override
  State<ScrumBoardColumn> createState() => _ScrumBoardColumnState();
}

class _ScrumBoardColumnState extends State<ScrumBoardColumn> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return DragTarget<Color>(
        onAccept: (data) => {setState(() => color = data)},
        builder: (context, _, __) => Container(
              alignment: Alignment.topCenter,
              width: 200,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color),
              child: Column(children: [
                Text(widget.header),
                const ScrumBoardItem(),
                const ScrumBoardItem()
              ]),
            ));
  }
}
