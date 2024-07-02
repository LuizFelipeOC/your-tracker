class SuccessPostDatabase {}

class FailurePostDatabase {}

class DatabaseError extends FailurePostDatabase {}

class SuccessGetDatabase {
  List<Map<String, Object?>> queryResult;

  SuccessGetDatabase({required this.queryResult});
}
