import 'package:result_dart/result_dart.dart';

import '../../models/packages_model.dart';
import 'results/search_package_results.dart';

abstract interface class IPackges {
  AsyncResult<SuccessPackages, FailurePackages> get({required String packCode});
  AsyncResult<SuccessFavoritePackage, FailureFavoritePackage> favorite({required PackagesModel package});
  AsyncResult<SuccesseGetAllPackages, FailureeGetAllPackages> getAllCachedPackages();
  AsyncResult<SuccessUpdateListPackages, FailureUpdateListPackages> update({required PackagesModel package});
}
