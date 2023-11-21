final class DatabaseQueries {
  final userQuery = '''
      CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          token TEXT NOT NULL,
          email TEXT NOT NULL UNIQUE
      );
    ''';
}
