/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/work_item_endpoint.dart' as _i3;
import 'package:scrumboardserverpod_server/src/generated/work_item.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'workItem': _i3.WorkItemEndpoint()
        ..initialize(
          server,
          'workItem',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['workItem'] = _i1.EndpointConnector(
      name: 'workItem',
      endpoint: endpoints['workItem']!,
      methodConnectors: {
        'getWorkItems': _i1.MethodConnector(
          name: 'getWorkItems',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['workItem'] as _i3.WorkItemEndpoint)
                  .getWorkItems(session),
        ),
        'addWorkItem': _i1.MethodConnector(
          name: 'addWorkItem',
          params: {
            'workItem': _i1.ParameterDescription(
              name: 'workItem',
              type: _i1.getType<_i4.WorkItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['workItem'] as _i3.WorkItemEndpoint).addWorkItem(
            session,
            params['workItem'],
          ),
        ),
        'updateWorkItem': _i1.MethodConnector(
          name: 'updateWorkItem',
          params: {
            'workItem': _i1.ParameterDescription(
              name: 'workItem',
              type: _i1.getType<_i4.WorkItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['workItem'] as _i3.WorkItemEndpoint).updateWorkItem(
            session,
            params['workItem'],
          ),
        ),
        'deleteWorkItem': _i1.MethodConnector(
          name: 'deleteWorkItem',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['workItem'] as _i3.WorkItemEndpoint).deleteWorkItem(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
