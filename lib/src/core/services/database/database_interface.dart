import 'package:result_dart/result_dart.dart';

import 'results/database_results.dart';

abstract interface class IDatabase {
  AsyncResult<SuccessInitializeDatabase, FailureInitializeDatabase> init();
  AsyncResult<SuccessCountDatabase, FailureCountDatabase> count({required String nameTable});
  AsyncResult<SuccessInsertDatabase, FailureInsertDatabase> insert({required String table, required Map<String, dynamic> value});
  AsyncResult<SuccessDeletedDatabase, FailureDeleteDatabase> delete({required String table, required String? where, List<Object>? whereArgs});
}
