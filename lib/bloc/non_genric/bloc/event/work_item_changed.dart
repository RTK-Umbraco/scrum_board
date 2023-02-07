import 'package:scrum_board/bloc/non_genric/bloc/event/work_item_event.dart';
import 'package:scrum_board/models/user.dart';

class WorkItemChangedEvent extends WorkItemEvent {
  final User _newUser;

  WorkItemChangedEvent(this._newUser);

  User get newUser => _newUser;
}
