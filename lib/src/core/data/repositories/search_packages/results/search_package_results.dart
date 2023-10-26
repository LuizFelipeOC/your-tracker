import '../../../models/packages_model.dart';

class SuccessPackages {
  PackagesModel packages;

  SuccessPackages({required this.packages});
}

class FailurePackages {
  String message;

  FailurePackages({required this.message});
}

class SuccessFavoritePackage {
  List<PackagesModel> list;

  SuccessFavoritePackage({required this.list});
}

class FailureFavoritePackage {
  String message;

  FailureFavoritePackage({required this.message});
}
