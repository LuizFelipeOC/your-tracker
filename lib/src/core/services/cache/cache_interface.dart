import 'package:result_dart/result_dart.dart';

import 'results/cache_results.dart';

abstract interface class ICache {
  AsyncResult<SuccessSaveResult, FailureSaveResult> save({required String key, dynamic value});
}
