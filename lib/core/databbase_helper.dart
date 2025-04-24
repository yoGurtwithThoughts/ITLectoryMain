import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper1 {
  static const _databaseName = "user.db";
  static const _databaseVersion = 1;
  static const table = 'users';
  static const columnId = 'id';
  static const columnUsername = 'username';
  static const columnUserPas = 'userpas';
  static const columnUserLog = 'userlog';

  DatabaseHelper1._privateConstructor();
  static final DatabaseHelper1 instance = DatabaseHelper1._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnUsername TEXT,
        $columnUserPas TEXT,
        $columnUserLog TEXT
      )
    ''');
  }
  
  Future<int> insertUser(String username) async {
    Database db = await database;
    Map<String, dynamic> row = {
      columnUsername: username,
    };
    return await db.insert(table, row);
  }
  Future<int> insertUser1(String username, userpas, userlog) async {
    Database db = await database;
    Map<String, dynamic> row = {
      columnUsername: username,
      columnUserPas: userpas,
      columnUserLog: userlog,
    };
    return await db.insert(table, row);
  }}

  class DatabaseHelper2 {
  static const _databaseName = "user.db";
  static const _databaseVersion = 1;
  static const table = 'users';
  static const columnId = 'id';
  static const columnUsername = 'username';

  DatabaseHelper2._privateConstructor();
  static final DatabaseHelper1 instance = DatabaseHelper1._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase1();
    return _database!;
  }
   Future _initDatabase1() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate1);
  }

  Future _onCreate1(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnUsername TEXT,
      )
    ''');
  }
  }