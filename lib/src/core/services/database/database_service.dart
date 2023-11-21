import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

import 'database_interface.dart';
import 'queries/database_queries.dart';
import 'results/database_results.dart';

class DatabaseService implements IDatabase {
  final DatabaseQueries _databaseQueries = DatabaseQueries();

  Future<String> get _getPathDatabase async => await getDatabasesPath();

  @override
  AsyncResult<SuccessInitializeDatabase, FailureInitializeDatabase> init() async {
    if (await databaseExists(await _getPathDatabase)) {
      return Success(SuccessInitializeDatabase());
    }

    try {
      await _createTablesDatabase();
      return Success(SuccessInitializeDatabase());
    } catch (error) {
      return Failure(FailureInitializeDatabase(message: error.toString()));
    }
  }

  @override
  AsyncResult<SuccessCountDatabase, FailureCountDatabase> count({required String nameTable}) async {
    final database = await openDatabase(await _getPathDatabase);

    try {
      final count = await database.query(nameTable);

      return Success(SuccessCountDatabase(quantityData: count.length));
    } catch (e) {
      return Failure(FailureCountDatabase(message: e.toString()));
    }
  }

  @override
  AsyncResult<SuccessInsertDatabase, FailureInsertDatabase> insert({required String table, required Map<String, dynamic> value}) async {
    final database = await openDatabase(await _getPathDatabase);

    try {
      await database.insert(table, value, conflictAlgorithm: ConflictAlgorithm.replace);
      return Success(SuccessInsertDatabase(isSaved: true));
    } catch (e) {
      return Failure(FailureInsertDatabase(message: e.toString()));
    }
  }

  @override
  AsyncResult<SuccessDeletedDatabase, FailureDeleteDatabase> delete({
    required String table,
    required String? where,
    List<Object>? whereArgs,
  }) async {
    final database = await openDatabase(await _getPathDatabase);

    try {
      await database.delete(table, where: where, whereArgs: whereArgs);
      return Success(SuccessDeletedDatabase(isDeleted: true));
    } catch (e) {
      return Failure(FailureDeleteDatabase(message: e.toString()));
    }
  }

  Future<Database> _createTablesDatabase() async {
    return await openDatabase(
      await _getPathDatabase,
      version: 1,
      onCreate: (Database database, int version) async => {
        await database.execute(_databaseQueries.userQuery),
      },
    );
  }
}
