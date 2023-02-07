import 'package:flutter/material.dart';
import 'package:scrum_board/models/work_item.dart';

class WorkItemWidget extends StatelessWidget {
  const WorkItemWidget({super.key, required this.workItem});

  final WorkItem workItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, border: Border.all(color: Colors.black)),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8.0),
      width: 280,
      child: Column(children: [
        Text('Item work id'),
        Text(workItem.header),
        Text(workItem.description),
        // const UserDropDownButton()
      ]),
    );
  }
}
