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

final class SuccesseGetAllPackages {
  final List<PackagesModel> list;

  SuccesseGetAllPackages({required this.list});
}

final class FailureeGetAllPackages {
  final String message;

  FailureeGetAllPackages({required this.message});
}

final class SuccessUpdateListPackages {
  List<PackagesModel> list;

  SuccessUpdateListPackages({required this.list});
}

final class FailureUpdateListPackages {
  String message;

  FailureUpdateListPackages({required this.message});
}
