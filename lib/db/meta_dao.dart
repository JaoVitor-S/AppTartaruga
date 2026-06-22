import 'package:assistentemovel/db/db_helper.dart';
import 'package:assistentemovel/domain/meta.dart';
import 'package:sqflite/sqflite.dart';

class MetaDao {
  Future<List<Meta>> listarMetas() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM META;');

    List<Meta> listaMetas = [];
    for (var json in listaResult) {
      Meta meta = Meta.fromJson(json);
      listaMetas.add(meta);
    }

    return listaMetas;
  }
}