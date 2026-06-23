import 'package:assistentemovel/db/db_helper.dart';
import 'package:assistentemovel/domain/meta.dart';
import 'package:sqflite/sqflite.dart';

// pra cada classe de dominio tem uma classe dao. Utiliza o ‘meta’ pra acessar o banco de dados
class MetaDao {
  Future<List<Meta>> listarMetas() async {

    Database db = await DBHelper().initDB();//inicia a conexão com o banco

    var listaResult = await db.rawQuery('SELECT * FROM META;'); //vai executar uma consulta em meta

    //jason é um tipo de arquivo que mostra sempre a chave/coluna do banco e em seguida mostra o valor dela.
    //cada chave é um elemento, cada elemento representa uma linha no banco de dados.
    //cada colchete é uma lista

    List<Meta> listaMetas = []; //começa vazia
    for (var json in listaResult) {

      Meta meta = Meta.fromJson(json); //cria a propriedade usando o construtor nomeado

      //toda vez ele vai pegar um elemento do json, converte ele pra meta, e adiciona essa meta na lista de metas
      listaMetas.add(meta);
    }

    return listaMetas;
  }
}