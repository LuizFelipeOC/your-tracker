import 'package:result_dart/result_dart.dart';

import 'results/cache_results.dart';

abstract interface class ICache {
  AsyncResult<SuccessSaveResult, FailureSaveResult> save({required String key, required dynamic value});
  AsyncResult<SuccessReadResult, FailureReadResult> read({required key});
}
