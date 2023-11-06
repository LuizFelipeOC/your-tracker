import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:result_dart/result_dart.dart';

import 'local_storage_dart.dart';
import 'results/local_storage_results.dart';

class FlutterSecureStorageService implements ILocalStorage {
  FlutterSecureStorage _secureStorageInitialize() {
    const localStorage = FlutterSecureStorage();

    return localStorage;
  }

  @override
  AsyncResult<SuccessSaveData, FailureSaveData> save({required String key, required value}) async {
    final localStorage = _secureStorageInitialize();

    try {
      await localStorage.write(key: key, value: value);

      return Success(SuccessSaveData());
    } catch (_) {
      return Failure(FailureSaveData());
    }
  }

  @override
  AsyncResult<SuccessReadData, FailureReadData> read({required String key}) async {
    final localStorage = _secureStorageInitialize();

    final result = await localStorage.read(key: key);

    if (result != null) {
      return Success(SuccessReadData(data: result));
    }

    return Failure(FailureReadData(message: 'This input is empty or key: $key dont exist'));
  }

  @override
  AsyncResult<SuccessDeleteAll, FailureDeleteAll> deleteAll() async {
    try {
      final localStorage = _secureStorageInitialize();

      await localStorage.deleteAll();

      return Success(SuccessDeleteAll(isDeleted: true));
    } catch (e) {
      return Failure(FailureDeleteAll(message: 'Ocur error when deleted all cached value $e'));
    }
  }
}
