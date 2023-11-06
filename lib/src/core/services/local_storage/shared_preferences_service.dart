import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_dart.dart';
import 'results/local_storage_results.dart';

class SharedPrefenceService implements ILocalStorage {
  @override
  AsyncResult<SuccessReadData, FailureReadData> read({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final getValue = preferences.get(key);

    if (getValue == null) {
      return Failure(FailureReadData(message: 'Dont have value in key: $key'));
    }

    return Success(SuccessReadData(data: getValue));
  }

  @override
  AsyncResult<SuccessSaveData, FailureSaveData> save({required String key, required value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (value is bool) {
      await preferences.setBool(key, value);
      return Success(SuccessSaveData());
    }

    if (value is String) {
      await preferences.setString(key, value);
      return Success(SuccessSaveData());
    }

    if (value is double) {
      await preferences.setDouble(key, value);
      return Success(SuccessSaveData());
    }
    if (value is int) {
      await preferences.setInt(key, value);
      return Success(SuccessSaveData());
    }

    return Failure(FailureSaveData());
  }

  @override
  AsyncResult<SuccessDeleteAll, FailureDeleteAll> deleteAll() => throw UnimplementedError();
}
