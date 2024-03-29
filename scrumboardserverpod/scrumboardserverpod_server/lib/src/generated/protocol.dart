/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'example.dart' as _i2;
import 'work_item.dart' as _i3;
import 'package:scrumboardserverpod_server/src/generated/work_item.dart' as _i4;
import 'package:serverpod/protocol.dart' as _i5;
export 'example.dart';
export 'work_item.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data, this) as T;
    }
    if (t == _i3.WorkItem) {
      return _i3.WorkItem.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.WorkItem?>()) {
      return (data != null ? _i3.WorkItem.fromJson(data, this) : null) as T;
    }
    if (t == List<_i4.WorkItem>) {
      return (data as List).map((e) => deserialize<_i4.WorkItem>(e)).toList()
          as dynamic;
    }
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.WorkItem) {
      return 'WorkItem';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'WorkItem') {
      return deserialize<_i3.WorkItem>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i5.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.WorkItem:
        return _i3.WorkItem.t;
    }
    return null;
  }
}
