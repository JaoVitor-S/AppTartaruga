import 'package:assistentemovel/db/db_helper.dart';
import 'package:assistentemovel/domain/propriedade.dart';
import 'package:sqflite/sqflite.dart';

class PropriedadeDao {

  Future<List<Propriedade>> listarPropriedades() async{
    Database db = await DbHelper().initDB();
    var listaResult = await db.rawQuery('SELECT * FROM PROPRIEDADE;');

    List <Propriedade> listaPropriedades = [];

    for(var json in listaResult){

      Propriedade propriedade = Propriedade.fromJson(json);
      listaPropriedades.add(propriedade);
    }

    return listaPropriedades;

  }

}