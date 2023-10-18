import 'package:result_dart/result_dart.dart';

import '../../models/packages_model.dart';

abstract interface class IPackges {
  AsyncResult<SuccessPackages, FailurePackages> get({required String packCode});
}

class SuccessPackages {
  PackagesModel packages;

  SuccessPackages({required this.packages});
}

class FailurePackages {
  String message;

  FailurePackages({required this.message});
}
