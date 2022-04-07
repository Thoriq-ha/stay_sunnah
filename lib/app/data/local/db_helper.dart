// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stay_sunnah/app/data/local/task_schema.dart';

class DBHelper {
  static const int _version = 1;
  static const String _tableName = "tasks";

  static Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        note TEXT,
        isCompleted INTEGER,
        date TEXT,
        startTime TEXT,
        endTime TEXT,
        color INTEGER,
        remind INTEGER,
        repeat INTEGER
      )
      """);
  }

  static Future<Database> db() async {
    return openDatabase(
      'tasks.db',
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(Task data) async {
    print("Insert Item function called");
    final db = await DBHelper.db();
    final id = await db.insert(_tableName, data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    print("Get Item function called");
    final db = await DBHelper.db();
    return db.query(_tableName, orderBy: "id");
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    print("Delete function called");
    final db = await DBHelper.db();
    try {
      await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
