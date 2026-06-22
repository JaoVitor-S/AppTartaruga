import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'assistente_academico.db';

    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);

    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = ''' CREATE TABLE META (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            concluida INTEGER NOT NULL DEFAULT 0
        );''';

    await db.execute(sql);

    sql = "INSERT INTO META (titulo, concluida) VALUES ('Completar o esboço do TCC', 0);";
    await db.execute(sql);

    sql = "INSERT INTO META (titulo, concluida) VALUES ('Aprender Inglês', 0);";
    await db.execute(sql);

    sql = "INSERT INTO META (titulo, concluida) VALUES ('Ler 12 livros no ano', 1);";
    await db.execute(sql);

    sql = "INSERT INTO META (titulo, concluida) VALUES ('Desenhar por 30 dias', 0);";
    await db.execute(sql);
  }
}