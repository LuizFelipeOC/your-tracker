import 'package:result_dart/result_dart.dart';

import 'results/http_results.dart';

abstract interface class IHttpService {
  AsyncResult<GetResultSuccess, GetResultError> get({
    required String url,
    required Map<String, String> params,
  });
}
