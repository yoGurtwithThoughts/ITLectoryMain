import 'package:itlectory4/core/chats_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    String path = join(await getDatabasesPath(), 'chat.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE messages (
        id INTEGER PRIMARY KEY,
        sender TEXT NOT NULL,
        content TEXT NOT NULL,
        imageUrl TEXT,
        filePath TEXT,
        audioPath TEXT,
        timestamp TEXT NOT NULL,
        replyTo INTEGER
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE messages ADD COLUMN imageUrl TEXT');
      await db.execute('ALTER TABLE messages ADD COLUMN filePath TEXT');
      await db.execute('ALTER TABLE messages ADD COLUMN audioPath TEXT');
      await db.execute('ALTER TABLE messages ADD COLUMN replyTo INTEGER');
    }
  }

  Future<void> insertMessage(Message message) async {
    final db = await database;
    await db.insert(
      'messages',
      {
        'id': message.id,
        'sender': message.sender,
        'content': message.content,
        'imageUrl': message.imageUrl,
        'filePath': message.filePath,
        'audioPath': message.audioPath,
        'timestamp': message.timestamp.toIso8601String(),
        'replyTo': message.replyTo,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Message>> getMessages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('messages');
    return List.generate(maps.length, (i) {
      return Message(
        id: maps[i]['id'],
        sender: maps[i]['sender'],
        content: maps[i]['content'],
        imageUrl: maps[i]['imageUrl'],
        filePath: maps[i]['filePath'],
        audioPath: maps[i]['audioPath'],
        timestamp: DateTime.parse(maps[i]['timestamp']),
        replyTo: maps[i]['replyTo'],
      );
    });
  }
}