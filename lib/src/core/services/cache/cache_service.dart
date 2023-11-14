import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache_interface.dart';
import 'results/cache_results.dart';

class CacheService implements ICache {
  @override
  AsyncResult<SuccessSaveResult, FailureSaveResult> save({required String key, required value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    if (value is String) {
      await preferences.setString(key, value);
      return Success(SuccessSaveResult());
    }

    if (value is double) {
      await preferences.setDouble(key, value);
      return Success(SuccessSaveResult());
    }

    if (value is bool) {
      await preferences.setBool(key, value);
      return Success(SuccessSaveResult());
    }

    if (value is int) {
      await preferences.setInt(key, value);
      return Success(SuccessSaveResult());
    }

    return Failure(FailureSaveResult());
  }
}
