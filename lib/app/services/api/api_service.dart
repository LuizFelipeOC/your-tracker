import 'package:result_dart/result_dart.dart';

import 'api_results.dart';

abstract interface class ApiService {
  AsyncResult<SuccessApi, FailureApi> get({Map<String, String>? queryParams});
}
