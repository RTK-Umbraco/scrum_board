import 'package:scrum_board/models/user.dart';

class Users {
  List<User> users = <User>[
    User('Unassigned'),
    User('Rasmus Kristensen'),
    User('Daniel Vuust'),
    User('Benjamin Snitzel')
  ];

  static final Users _instance = Users._internal();

  factory Users() {
    return _instance;
  }

  Users._internal();
}
