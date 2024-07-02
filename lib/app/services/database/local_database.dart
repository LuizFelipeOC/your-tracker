import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';
import 'results.dart';

class LocalDatabase implements IDatabase {
  Future<String> _getPath() async {
    var database = await getDatabasesPath();
    final String path = join(database, 'package.db');
    return path;
  }

  @override
  Future<Database> init() async {
    String path = await _getPath();

    Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE tracking (
        tracking_code TEXT PRIMARY KEY,
        last_update DATETIME NOT NULL,
        category TEXT
        );  
    ''');
    });

    return database;
  }

  @override
  AsyncResult<SuccessPostDatabase, FailurePostDatabase> post({required Map<String, Object> values}) async {
    try {
      final database = await init();
      await database.insert('tracking', values);

      return Success(SuccessPostDatabase());
    } on DatabaseException catch (databaseError) {
      debugPrint(databaseError.toString());
      return Failure(DatabaseError());
    } catch (e) {
      return Failure(FailurePostDatabase());
    }
  }

  @override
  AsyncResult<SuccessGetDatabase, FailurePostDatabase> get({required String table, String? where, List<Object>? whereArgs}) async {
    try {
      final database = await init();
      final query = await database.query(table, where: where, whereArgs: whereArgs);

      return Success(SuccessGetDatabase(queryResult: query));
    } on DatabaseException catch (databaseError) {
      debugPrint(databaseError.toString());
      return Failure(DatabaseError());
    } catch (e) {
      return Failure(FailurePostDatabase());
    }
  }
}
