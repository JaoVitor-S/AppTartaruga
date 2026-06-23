import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'assistente.db';
    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = ''' CREATE TABLE LEMBRETE (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT,
            horario TEXT,
            data TEXT
        );''';
    await db.execute(sql);


    await db.insert('LEMBRETE', {'titulo': 'Apresentação de Programação Móvel', 'horario': '17:00', 'data': '19/05/2026'});
    await db.insert('LEMBRETE', {'titulo': 'Estudar para Espanhol', 'horario': '21:00', 'data': '22/05/2026'});
    await db.insert('LEMBRETE', {'titulo': 'Fazer exercícios de Matemática', 'horario': '19:15', 'data': '21/05/2026'});
  }
}
