import 'dart:io';

import 'package:mood_tracker_v2/app/labels.dart';
import 'package:mood_tracker_v2/db_handler/models/emotional_state_model.dart';
import 'package:mood_tracker_v2/db_handler/models/group_count_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


/// A singleton class to manage connections to the SQLite database.
///
/// This class provides a static object [handler] that grants access to
/// helper methods with a single connection to the global database.
///
/// Exceptions are not currently thrown or handled by methods of this class.
class DBHandler {
  static const String _databaseName = "MoodTracker.db";
  static const int _version = 1;

  // ================= Singleton instance of database handler =================
  DBHandler._privateConstructor();

  /// A static object that ensure a single connection to the SQLite database.
  static final DBHandler handler = DBHandler._privateConstructor();

  // Force single connection to database
  static late Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    } else {
      return _database;
    }

    return _database;
  }

  /// Method to open connection to database.
  _initDatabase() async {
    // get directory for given platform.
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);

    // Make sure the directory exists
    try {
      await Directory(databasePath).create(recursive: true);
    } catch (_) {}

    // open connection
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  /// Method to create database schema
  Future _onCreate(Database db, int version) async {
    print("Creating DB $_databaseName with table $tableEmotionalState...");
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $tableEmotionalState (
      $columnID INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnFeeling TEXT NOT NULL,
      $columnUpTo TEXT NOT NULL,
      $columnSleep TEXT NOT NULL,
      $columnMedication TEXT NOT NULL,
      $columnAnxiety TEXT NOT NULL,
      $columnStress TEXT NOT NULL,
      $columnCoping TEXT NOT NULL,
      $columnProductivity TEXT NOT NULL,
      $columnSuicide TEXT NOT NULL,
      $columnHarm TEXT NOT NULL, 
      $columnDate INT NOT NULL
    )
    ''');
    print("DB Creation successful!");
  }

// ================= Helper methods =================

// destroy
  /// A helper method to delete the SQLite database.
  ///
  /// This method is for testing purposes only and should not be used
  /// trivially.
  // _destroyDB() async {
  //   String directoryPath = await getDatabasesPath();
  //   String path = join(directoryPath, _databaseName);
  //   deleteDatabase(path);
  //   _database = null;
  // }


  fromMappedList(List<Map<String, dynamic>> mapsList) {
    List mappedList = [];
    if (mapsList.isEmpty) {
      mappedList.add(null);
    } else {
      for (var map in mapsList) {
        mappedList.add(EmotionalState.fromMap(map));
      }
    }
    return mappedList;
  }

  Future<int> insert(EmotionalState emotionalState) async {
    Database db = await database;
    int id = await db.insert(tableEmotionalState, emotionalState.toMap());
    return id;
  }

  getGroupQuery(String groupColumn) async {
    Database db = await database;

    String query =
        'SELECT $groupColumn, COUNT($groupColumn) $groupColumnCount '
        'FROM $tableEmotionalState GROUP BY $groupColumn';

    // {'$groupColumn': String category_name, '$groupCount': double cost_sum}
    List<Map<String, dynamic>> maps = await db.rawQuery(query);

    List<GroupCount> mappedList = maps.isNotEmpty
        ? maps.map<GroupCount>((map) => GroupCount.fromMap(groupColumn, map))
        .toList()
        : [];

    return mappedList;
  }

}
