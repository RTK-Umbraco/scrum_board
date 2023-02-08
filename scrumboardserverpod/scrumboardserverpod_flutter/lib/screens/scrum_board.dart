import 'package:flutter/material.dart';
import 'package:scrumboardserverpod_flutter/lib/widgets/work_item_drag_and_drop_list.dart';
import 'package:scrumboardserverpod_flutter/main.dart';
import 'package:scrumboardserverpod_flutter/screens/scrum_board_item_form.dart';
import 'package:scrumboardserverpod_client/scrumboardserverpod_client.dart';

class ScrumBoard extends StatefulWidget {
  const ScrumBoard({Key? key, required this.client}) : super(key: key);
  final Client client;
  @override
  State createState() => _ScrumBoard();
}

class ScrumBoardColumn {
  String columnHeader;

  List<WorkItem> workItems;
  ScrumBoardColumn({required this.columnHeader, required this.workItems});
}

class _ScrumBoard extends State<ScrumBoard> {
  late List<ScrumBoardColumn> _scrumBoardColumns;
  late List<WorkItem> _workItems = [];

  Future<List<WorkItem>> fetchWorkItem() async {
    try {
      print('Getting workitems');
      var workItems = await widget.client.workItem.getWorkItems();
      _workItems = workItems;

      print('Collted workitems');

      return workItems;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  void initState() {
    super.initState();

    List<String> columnHeaderNames = [
      'To do',
      'In progress',
      'In Review',
      'Resolved',
      'Deployed to development',
      'Deployed to live',
      'Done'
    ];
    _scrumBoardColumns = validateColumnWorkItems(columnHeaderNames);
  }

  validateColumnWorkItems(List<String> columnHeaderNames) {
    List<ScrumBoardColumn> scrumBoardColumns = [];

    for (var i = 0; i < columnHeaderNames.length; i++) {
      if (columnHeaderNames[i].contains('To do')) {
        scrumBoardColumns.add(ScrumBoardColumn(
            columnHeader: columnHeaderNames[i].toString(),
            workItems: _workItems));
      } else {
        scrumBoardColumns.add(ScrumBoardColumn(
            columnHeader: columnHeaderNames[i].toString(), workItems: []));
      }
    }
    return scrumBoardColumns;
  }

  addWorkItem(WorkItem workItem) async {
    try {
      var result = await client.workItem.addWorkItem(workItem);

      if (result) {
        setState(() {});
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrum board'),
      ),
      body: FutureBuilder<List<WorkItem>>(
        future: fetchWorkItem(),
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            <Widget>[
              ColumnDragAndDrop(
                  scrumBoardColumns: _scrumBoardColumns,
                  workItems: _scrumBoardColumns[0].workItems = snapshot.data!),
            ];
          }
          return ColumnDragAndDrop(
            scrumBoardColumns: _scrumBoardColumns,
            workItems: _workItems,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final workItem = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ScrumboardItemForm()));

            setState(() {
              _scrumBoardColumns[0].workItems.add(workItem);
              addWorkItem(workItem);
            });
          },
          tooltip: 'Add work item',
          icon: const Icon(Icons.add),
          label: const Text('Add item')),
    );
  }
}
