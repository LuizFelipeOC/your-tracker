import 'package:result_dart/result_dart.dart';

import 'results.dart';

abstract interface class IDatabase {
  Future<void> init();
  AsyncResult<SuccessPostDatabase, FailurePostDatabase> post({required Map<String, Object> values});
  AsyncResult<SuccessGetDatabase, FailurePostDatabase> get({required String table, String? where, List<Object>? whereArgs});
}
