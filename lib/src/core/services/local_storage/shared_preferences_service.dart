import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_dart.dart';

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
  AsyncResult<SuccessSaveData, FailureSaveData> save({required String key, required value}) => throw UnimplementedError();

  @override
  AsyncResult<SuccessDeleteAll, FailureDeleteAll> deleteAll() => throw UnimplementedError();
}
