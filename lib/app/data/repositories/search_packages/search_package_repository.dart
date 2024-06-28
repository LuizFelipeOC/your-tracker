import 'package:result_dart/result_dart.dart';

import '../../../services/api/api_service.dart';
import '../../model/package_model.dart';
import 'results.dart';

class SearchPackageRepository {
  late ApiService _apiService;

  SearchPackageRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  AsyncResult<SuccessSearchPackage, FailureSearchPackage> get({required String code}) async {
    try {
      final result = await _apiService.get(queryParams: {'codigo': code});

      return result.fold((onSuccess) {
        final response = PackageModel.fromMap(onSuccess.data!);

        return Success(SuccessSearchPackage(package: response));
      }, (onFailure) {
        if (onFailure.statusCode != null && onFailure.statusCode == 401) {
          return Failure(FailureSearchPackage(message: 'Unauthorized'));
        }

        return Failure(FailureSearchPackage(message: onFailure.message.toString()));
      });
    } catch (_) {
      return Failure(FailureSearchPackage(message: _.toString()));
    }
  }
}
