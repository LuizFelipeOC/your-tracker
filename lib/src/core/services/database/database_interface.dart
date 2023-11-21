import 'package:result_dart/result_dart.dart';

import 'results/database_results.dart';

abstract interface class IDatabase {
  AsyncResult<SuccessInitializeDatabase, FailureInitializeDatabase> init();
}
