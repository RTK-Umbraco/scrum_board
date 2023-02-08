import 'package:scrumboardserverpod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class WorkItemEndpoint extends Endpoint {
  Future<List<WorkItem>> getWorkItems(Session session) async {
    return await WorkItem.find(session);
  }

  Future<bool> addWorkItem(Session session, WorkItem workItem) async {
    //Add try catched if insert fails.
    session.log('Logging session');
    await WorkItem.insert(session, workItem);
    return true;
  }

  Future<bool> updateWorkItem(Session session, WorkItem workItem) async {
    //Add try catched if insert fails.
    var result = await WorkItem.update(session, workItem);
    return result;
  }

  Future<bool> deleteWorkItem(Session session, int id) async {
    //Add try catched if insert fails.
    var result = await WorkItem.delete(session,
        where: (workitem) => workitem.id.equals(id));
    return result == 1;
  }
}
