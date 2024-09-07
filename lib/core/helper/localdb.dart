import 'dart:async';

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:tasko/features/home/model/task.dart';
import 'package:tasko/features/notification/notification_service.dart';

class LocalDB {
  static const dbName = 'initial.db';
  late sqflite.Database db;
  LocalDB();

  /// Return the path to the local db
  Future<String> get dbPath async =>
      p.join(await sqflite.getDatabasesPath(), LocalDB.dbName);

  Future<void> init() async {
    db = await sqflite.openDatabase(
      await dbPath,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  FutureOr<void> _onCreate(
    sqflite.Database db,
    int version,
  ) async {
    // create Task Table
    await db.execute('''
  CREATE TABLE Task (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    due_date TEXT,
    is_completed INTEGER
  )
''');

// create UserInfo table
    await db.execute('''
      CREATE TABLE UserInfo (
      theme TEXT
    )
    ''');

    // insert initial values to UserInfo table
    await db.insert('UserInfo', {'theme': 'SYSTEM'});
  }

  FutureOr<void> _onUpgrade(
    sqflite.Database db,
    int oldVersion,
    int newVersion,
  ) async {
    // this method will be implemented when we release
    // to play store and the new version that we are
    // releasing has schema changes than the previous
    // version.
  }

  Future<int> insertTask(Task task) async {
    final result = await db.insert('Task', task.toMap());
    // Schedule a notification one hour before the due date

    // DateTime notificationTime = task.dueDate.subtract(const Duration(hours: 1));
    await NotificationService.scheduleTaskNotification(task);
    return result;
  }

  Future<List<Task>> getTasks() async {
    final List<Map<String, dynamic>> results = await db.query('Task');
    return List.generate(results.length, (i) {
      return Task.fromMap(results[i]);
    });
  }

  Future<int> completeTask(int id) async {
    final updateCount = await db.rawUpdate(
      'UPDATE Task SET is_completed = ? WHERE id=?',
      [1, id],
    );
    return updateCount;
  }
}
