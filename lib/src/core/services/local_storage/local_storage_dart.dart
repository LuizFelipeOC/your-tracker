import 'package:result_dart/result_dart.dart';

import 'results/local_storage_results.dart';

abstract interface class ILocalStorage {
  AsyncResult<SuccessSaveData, FailureSaveData> save({required String key, required dynamic value});
  AsyncResult<SuccessReadData, FailureReadData> read({required String key});
  AsyncResult<SuccessDeleteAll, FailureDeleteAll> deleteAll();
}
