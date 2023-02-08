import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:scrumboardserverpod_client/scrumboardserverpod_client.dart';
import 'package:scrumboardserverpod_flutter/lib/widgets/work_item_widget.dart';
import 'package:scrumboardserverpod_flutter/screens/scrum_board.dart';

class ColumnDragAndDrop extends StatefulWidget {
  const ColumnDragAndDrop(
      {super.key, required this.scrumBoardColumns, required this.workItems});
  final List<ScrumBoardColumn> scrumBoardColumns;
  final List<WorkItem>? workItems;
  @override
  State<ColumnDragAndDrop> createState() => _ColumnDragAndDropState();
}

class _ColumnDragAndDropState extends State<ColumnDragAndDrop> {
  @override
  Widget build(BuildContext context) {
    return DragAndDropLists(
      children: List.generate(widget.scrumBoardColumns.length,
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
    );
  }

  _buildScrumBoardColumns(int columnIndex) {
    var scrumBoardColumn = widget.scrumBoardColumns[columnIndex];
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
      var movedItem = widget.scrumBoardColumns[oldListIndex].workItems
          .removeAt(oldItemIndex);
      widget.scrumBoardColumns[newListIndex].workItems
          .insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = widget.scrumBoardColumns.removeAt(oldListIndex);
      widget.scrumBoardColumns.insert(newListIndex, movedList);
    });
  }
}
