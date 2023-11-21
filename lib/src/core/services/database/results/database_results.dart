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

final class SuccessInsertDatabase {
  bool isSaved = false;

  SuccessInsertDatabase({required this.isSaved});
}

final class FailureInsertDatabase {
  String message;

  FailureInsertDatabase({required this.message});
}

final class SuccessDeletedDatabase {
  bool isDeleted = false;

  SuccessDeletedDatabase({required this.isDeleted});
}

final class FailureDeleteDatabase {
  String message;

  FailureDeleteDatabase({required this.message});
}
