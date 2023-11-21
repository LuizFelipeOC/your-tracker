final class SuccessInitializeDatabase {}

final class FailureInitializeDatabase {
  String message;

  FailureInitializeDatabase({required this.message});
}

final class SuccessCountDatabase {
  int quantityData;

  SuccessCountDatabase({required this.quantityData});
}

final class FailureCountDatabase {
  String message;

  FailureCountDatabase({required this.message});
}
