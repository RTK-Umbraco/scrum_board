import 'package:flutter/material.dart';
import 'package:scrumboardserverpod_flutter/bloc/non_genric/bloc/event/work_item_changed.dart';
import 'package:scrumboardserverpod_flutter/bloc/non_genric/bloc/work_item_bloc.dart';
import 'package:scrumboardserverpod_flutter/models/user.dart';
import 'package:scrumboardserverpod_flutter/models/users.dart';

class UserDropDownButton extends StatefulWidget {
  const UserDropDownButton({super.key, required this.workItemBloc});
  final WorkItemChangedBloc workItemBloc;

  @override
  State<UserDropDownButton> createState() => _UserDropDownButtonState();
}

class _UserDropDownButtonState extends State<UserDropDownButton> {
  User dropdownUserValue = Users().users.first;

  late User? user;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<User>(
      value: dropdownUserValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (User? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownUserValue = value!;
        });
      },
      onSaved: (User? value) {
        user = dropdownUserValue;
        widget.workItemBloc.workItemChangedEventSink
            .add(WorkItemChangedEvent(user!));
        print('User that is sent with event: ' + user!.userName);
      },
      validator: (value) {
        if (value == null || value.userName.isEmpty) {
          return 'Please select work item user';
        }
        return null;
      },
      items: Users().users.map((User value) {
        return DropdownMenuItem<User>(
          value: value,
          child: Text(value.userName),
        );
      }).toList(),
    );
  }
}
