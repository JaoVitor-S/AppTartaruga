import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async { //É preciso de um local/caminho que o banco de dados vai ficar armazenado
    String path = await getDatabasesPath();
    String dbName = 'assistente_academico.db';

    String dbPath = join(path,dbName); //junta os endereços.Como no caminho tem várias barras, o join vai servir pra tirar esse empecilho/problema


    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    //aqui ele vai abrir, ou se caso seja a primeira instalação, ele vai criar o banco de dados


    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = ''' CREATE TABLE META (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            concluida INTEGER NOT NULL DEFAULT 0
        );''';

    await db.execute(sql); //Criação da tabela


    sql = "INSERT INTO META (titulo, concluida) VALUES ('Completar o esboço do TCC', 0);";
    await db.execute(sql); //adicionar os valores às variaveis titulo e concluida


    sql = "INSERT INTO META (titulo, concluida) VALUES ('Aprender Inglês', 0);";
    await db.execute(sql); //mesma coisa

    sql = "INSERT INTO META (titulo, concluida) VALUES ('Ler 12 livros no ano', 1);";
    await db.execute(sql); //mesmo

    sql = "INSERT INTO META (titulo, concluida) VALUES ('Desenhar por 30 dias', 0);";
    await db.execute(sql); //mesmo
  }
}