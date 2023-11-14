import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache_interface.dart';
import 'results/cache_results.dart';

class CacheService implements ICache {
  final SharedPreferences sharedPreferences;

  CacheService({required this.sharedPreferences});

  @override
  AsyncResult<SuccessSaveResult, FailureSaveResult> save({required String key, required value}) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return Success(SuccessSaveResult());
    }

    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return Success(SuccessSaveResult());
    }

    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return Success(SuccessSaveResult());
    }

    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return Success(SuccessSaveResult());
    }

    return Failure(FailureSaveResult());
  }

  @override
  AsyncResult<SuccessReadResult, FailureReadResult> read({required key}) async {
    final response = sharedPreferences.get(key);

    if (response == null) return Failure(FailureReadResult());

    return Success(SuccessReadResult(response: response));
  }
}
