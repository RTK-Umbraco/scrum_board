import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scrumboardserverpod_flutter/main.dart';

class WorkItemDeleteWidget extends StatefulWidget {
  const WorkItemDeleteWidget({super.key, required this.workItemId});
  final int? workItemId;
  @override
  State<WorkItemDeleteWidget> createState() => _WorkItemDeleteWidgetState();
}

class _WorkItemDeleteWidgetState extends State<WorkItemDeleteWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () async {
          setState(() {
            deleteWorkItem();
          });
        },
        tooltip: 'Delete work item',
        icon: const Icon(Icons.delete),
        label: const Text('Delete work item'));
  }

  deleteWorkItem() async {
    try {
      var result = await client.workItem.deleteWorkItem(widget.workItemId!);
      print('Work item deleted');

      if (result) {
        setState(() {});
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
