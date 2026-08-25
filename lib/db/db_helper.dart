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
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
      String sql = ''' CREATE TABLE PERIODO (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              horaInicio TEXT,
              horaFim TEXT  ) ''';

    await db.execute(sql);

    //Registro inicial
    sql = "INSERT INTO PERIODO (horaInicio, horaFim) VALUES ('22:00', '07:00');";
    await db.execute(sql);
  }
}