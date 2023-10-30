import 'package:result_dart/result_dart.dart';

import '../../../../core/services/local_storage/local_storage_dart.dart';
import 'welcome_results/welcome_results.dart';

class WelcomeRepository {
  final ILocalStorage localStorage;

  WelcomeRepository({required this.localStorage});

  AsyncResult<SuccessStartNow, FailureStartNow> startNow() async {
    final resultSavege = await localStorage.save(key: 'start', value: 'true');

    if (resultSavege.isSuccess()) {
      return Success(SuccessStartNow());
    }

    return Failure(FailureStartNow());
  }
}
