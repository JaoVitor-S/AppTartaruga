import 'package:assistentemovel/domain/meta.dart';
import 'package:dio/dio.dart';

class MetasApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/euDavi01/fake-api-davi';
  //guarda o endereço da api que vamos chamar, mas diferentemente do outro
  //esse é só o endereço base, ainda falta dizer o recurso que vai ser utilizado

  Future<List<Meta>> listarMetas() async {
    //metodo que vai retornar a lista inteira de metas, em formato json

    final response = await dio.get('$baseUrl/metas');
    //ele vai fazer a requisição
    //aqui ele vai fazer a concatenação entre o endereço base e a coleção que tem todos os json


    List<Meta> listaMetas = [];
    //cria a lista vazia

    for (var json in response.data) {
    //percorre toda a lista de metas no formato json

      Meta meta = Meta.fromJson(json);
      //transforma o json em um objeto (meta)


      listaMetas.add(meta);
      //adiciona na lista de metas
    }

    return listaMetas;

  }
}