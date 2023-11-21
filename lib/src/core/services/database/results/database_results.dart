final class SuccessInitializeDatabase {}

final class FailureInitializeDatabase {
  String message;

  FailureInitializeDatabase({required this.message});
}
