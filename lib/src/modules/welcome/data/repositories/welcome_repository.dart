import 'package:result_dart/result_dart.dart';

import '../../../../core/services/local_storage/local_storage_dart.dart';

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

final class SuccessStartNow {}

final class FailureStartNow {}
