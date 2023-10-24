import 'package:result_dart/result_dart.dart';

import '../../../../core/services/local_storage/local_storage_dart.dart';
import '../results/get_start_now_results.dart';

class SplashRepository {
  final ILocalStorage storage;

  SplashRepository({required this.storage});

  AsyncResult<SuccessGetStartNow, FailureGetStartNow> getStartNow() async {
    final result = await storage.read(key: 'start');

    if (result.isSuccess()) {
      return Success(SuccessGetStartNow(message: 'Have cached info in start now'));
    }

    return Failure(FailureGetStartNow(message: 'Occur an error during verfiy cache info'));
  }
}
