import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
import 'package:assistentemovel/dominios/periodo.dart';

class PeriodoDao {
  Future<List<Periodo>> listarPeriodos() async {
    //Acessa o banco de dados
    Database db = await DBHelper().initDB();
    //Consulta
    var listaResult = await db.rawQuery('SELECT * FROM PERIODO;');

    List<Periodo> lista = [];
    //percorrer a lista de elementos
    for (var json in listaResult) {
      lista.add(Periodo.fromJson(json));
    }
    return lista;
  }
  //Novo registro
  Future<void> inserir(Periodo periodo) async {
    Database db = await DBHelper().initDB();
    await db.insert('PERIODO', periodo.toMap());
  }
  //Editar
  Future<void> atualizar(Periodo periodo) async {
    Database db = await DBHelper().initDB();
    await db.update('PERIODO', periodo.toMap(), where: 'id = ?', whereArgs: [periodo.id]);
  }
  //Deletar
  Future<void> deletar(int id) async {
    Database db = await DBHelper().initDB();
    await db.delete('PERIODO', where: 'id = ?', whereArgs: [id]);
  }
}