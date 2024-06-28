import '../../model/package_model.dart';

class SuccessSearchPackage {
  final PackageModel package;

  SuccessSearchPackage({required this.package});
}

class FailureSearchPackage {
  String message;

  FailureSearchPackage({required this.message});
}
