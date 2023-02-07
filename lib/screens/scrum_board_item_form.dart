import 'package:flutter/material.dart';
import 'package:scrum_board/bloc/non_genric/bloc/work_item_bloc.dart';
import 'package:scrum_board/models/user.dart';
import 'package:scrum_board/models/work_item.dart';
import 'package:scrum_board/widgets/user_drop_down_button.dart';

// final ValueChangedBloc<ValueChangedEvent<User>> userBloc =
//     ValueChangedBloc(ValueChangedEvent(User('Test user')));

class ScrumboardItemForm extends StatefulWidget {
  const ScrumboardItemForm({super.key});

  @override
  State<ScrumboardItemForm> createState() => _ScrumboardItemFormState();
}

class _ScrumboardItemFormState extends State<ScrumboardItemForm> {
  final WorkItemChangedBloc _workItemChangedBloc = WorkItemChangedBloc();

  late WorkItem? workItem = WorkItem(header: '', description: '');

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work item'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: workItem?.header,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Work item header',
                      hintText: 'Insert Work item header of the work item',
                    ),
                    onSaved: (String? value) {
                      workItem?.header = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter work item headline';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: workItem?.description,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Work item description',
                      hintText: 'Insert Work item description of the work item',
                    ),
                    onSaved: (String? value) {
                      workItem?.description = value ?? '';
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter work item decsription';
                      }
                      return null;
                    },
                  ),
                  Container(
                      child: StreamBuilder(
                    stream: _workItemChangedBloc.userStream,
                    initialData: User('Unassigned'),
                    builder:
                        (BuildContext context, AsyncSnapshot<User> snapshot) {
                      print('Snapshot user: ${snapshot.data?.userName}');
                      return Column(
                        children: [
                          UserDropDownButton(
                            workItemBloc: _workItemChangedBloc,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState?.save();

                                var itemWork = WorkItem(
                                    header: workItem!.header,
                                    description: workItem!.description);

                                Navigator.pop(context, itemWork);
                              }
                            },
                            child: const Text('Add item'),
                          ),
                        ],
                      );
                    },
                  )),
                ],
              ))
        ],
      ),
    );
  }
}
