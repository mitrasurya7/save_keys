import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  void _onCreate(Database db, int version) async {
    // Create tables here
    await db.execute('''
      CREATE TABLE Keynotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        account TEXT,
        password INTEGER,
        createdAt TEXT,
      )
    ''');
    await db.execute('''
      CREATE TABLE User (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT
        password TEXT
      )
  ''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrade if needed
  }

  Future close() async {
    var db = await database;
    db.close();
  }
}
