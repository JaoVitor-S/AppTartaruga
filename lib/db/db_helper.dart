import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  //Future<TipoDoRetorno>
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'app_database.db';
    String dbPath = join(path, dbName);

    // Criar / Abrir
    return await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    //Criar a tabela
    await db.execute('''
      CREATE TABLE PERIODO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        horaInicio TEXT,
        horaFim TEXT
      )
    ''');
    //Registro inicial
    await db.execute("INSERT INTO PERIODO (horaInicio, horaFim) VALUES ('22:00', '07:00');");
  }
}