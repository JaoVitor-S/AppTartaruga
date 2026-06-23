import 'package:sqflite/sqflite.dart';
import 'lembrete.dart';
import 'database_helper.dart';

class LembreteDao {
  Future<List<Lembrete>> listarLembretes() async {
    Database db = await DatabaseHelper().initDB();
    var listaResult = await db.rawQuery('SELECT * FROM LEMBRETE;');

    List<Lembrete> listaLembretes = [];
    for (var json in listaResult) {
      Lembrete lembrete = Lembrete.fromJson(json);
      listaLembretes.add(lembrete);
    }
    return listaLembretes;
  }

  Future<void> inserirLembrete(Lembrete lembrete) async {
    Database db = await DatabaseHelper().initDB();
    await db.insert('LEMBRETE', lembrete.toJson());
  }

  Future<void> atualizarLembrete(Lembrete lembrete) async {
    Database db = await DatabaseHelper().initDB();
    await db.update('LEMBRETE', lembrete.toJson(), where: 'id = ?', whereArgs: [lembrete.id]);
  }

  Future<void> deletarLembrete(int id) async {
    Database db = await DatabaseHelper().initDB();
    await db.delete('LEMBRETE', where: 'id = ?', whereArgs: [id]);
  }
}
