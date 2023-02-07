import 'dart:async';

import 'package:scrum_board/bloc/non_genric/bloc/event/work_item_changed.dart';
import 'package:scrum_board/bloc/non_genric/bloc/event/work_item_event.dart';
import 'package:scrum_board/models/user.dart';

class WorkItemChangedBloc {
  //stream handling
  final _colorChangedStateController = StreamController<User>();

  StreamSink<User> get _currentUser => _colorChangedStateController.sink;

  Stream<User> get userStream => _colorChangedStateController.stream;

  //sink handling
  final _workItemChangedEventController = StreamController<WorkItemEvent>();

  Sink<WorkItemEvent> get workItemChangedEventSink =>
      _workItemChangedEventController.sink;

  WorkItemChangedBloc() {
    _workItemChangedEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(WorkItemEvent event) {
    if (event is WorkItemChangedEvent) {
      _currentUser.add(event.newUser);
    }
  }

  void dispose() {
    _workItemChangedEventController.close();
    _colorChangedStateController.close();
  }
}
