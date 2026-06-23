import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'atividades.db';
    String dbPath = join(path, dbName);
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    await resetData(db);
    return db;
  }

  Future<void> resetData(Database db) async {
    await db.delete('PROPRIEDADE');
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Redação', '2/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Física', '4/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Aulão Exatas', '5/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Simulado 1', '7/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Trabalho Geo.', '12/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Simulado 2', '14/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Questões Logaritmo', '15/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Corrigir Simulados', '17/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Lista Matemática', '19/7/2026');");
    await db.execute("INSERT INTO Propriedade (materia, prazo) VALUES ('Lista Humanas', '21/7/2026');");

  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = '''
      CREATE TABLE PROPRIEDADE (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          materia TEXT,
          prazo TEXT
      );
    ''';

    await db.execute(sql);

  }
}