import 'package:flutter_chat_ui/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'json.dart';
import 'message_model.dart';

class Message {
  static late User sendername;
  static late String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  static late String text;
  static late String unread;

  Message({
    sendername,
    time,
    text,
    unread,
  });

  Message fromJson(Map<dynamic, dynamic> json) => Message(
    sendername: sendername, time: time, text: text, unread: unread,
  );

  Map<String, Object> toJson() => {
    sendername.name : sendername,
    time : time,
    text : text,
    unread : unread,
  };
}

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();

  static Database? _database;

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('db.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${Message.sendername}, 
  ${Message.time} $textType,
  ${Message.text} $textType,
  ${Message.unread} $textType
  )
''');
  }

  Future<Message> create(Message Message) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, Message.toJson());
    return Message;
  }

  Future<Message> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Message().fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Message>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => Message().fromJson(json)).toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      Message().toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}