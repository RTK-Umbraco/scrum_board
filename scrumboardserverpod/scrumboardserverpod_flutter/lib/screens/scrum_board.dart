import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:scrumboardserverpod_flutter/lib/widgets/work_item_widget.dart';
import 'package:scrumboardserverpod_flutter/models/work_item.dart';
import 'package:scrumboardserverpod_flutter/screens/scrum_board_item_form.dart';

class ScrumBoard extends StatefulWidget {
  const ScrumBoard({Key? key}) : super(key: key);

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

    _scrumBoardColumns = List.generate(columnHeaderNames.length, (outerIndex) {
      return ScrumBoardColumn(
          columnHeader: columnHeaderNames[outerIndex].toString(),
          workItems: [
            WorkItem(
                header: 'headline 1 headline 1 ', description: 'description 1'),
            WorkItem(header: 'headline 2', description: 'description 2')
          ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scrum board'),
        ),
        body: DragAndDropLists(
          children: List.generate(_scrumBoardColumns.length,
              (columnIndex) => _buildScrumBoardColumns(columnIndex)),
          onItemReorder: _onItemReorder,
          onListReorder: _onListReorder,
          axis: Axis.horizontal,
          listWidth: 300,
          listDraggingWidth: 300,
          listDecoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(Radius.circular(7.0)),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black45,
                spreadRadius: 3.0,
                blurRadius: 6.0,
                offset: Offset(2, 3),
              ),
            ],
          ),
          listPadding: const EdgeInsets.all(8.0),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final workItem = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScrumboardItemForm()));

              setState(() {
                _scrumBoardColumns[0].workItems.add(workItem);
              });
            },
            tooltip: 'Add work item',
            icon: const Icon(Icons.add),
            label: const Text('Add item')));
  }

  _buildScrumBoardColumns(int columnIndex) {
    var scrumBoardColumn = _scrumBoardColumns[columnIndex];
    return DragAndDropList(
      header: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(7.0)),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                scrumBoardColumn.columnHeader,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
          ),
        ],
      ),
      leftSide: const VerticalDivider(
        color: Colors.blue,
        width: 1.5,
        thickness: 1.5,
      ),
      rightSide: const VerticalDivider(
        color: Colors.blue,
        width: 1.5,
        thickness: 1.5,
      ),
      children: List.generate(scrumBoardColumn.workItems.length,
          (index) => _buildScrumBoardItem(scrumBoardColumn.workItems[index])),
    );
  }

  _buildScrumBoardItem(WorkItem workItem) {
    return DragAndDropItem(child: WorkItemWidget(workItem: workItem));
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem =
          _scrumBoardColumns[oldListIndex].workItems.removeAt(oldItemIndex);
      _scrumBoardColumns[newListIndex]
          .workItems
          .insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _scrumBoardColumns.removeAt(oldListIndex);
      _scrumBoardColumns.insert(newListIndex, movedList);
    });
  }
}
