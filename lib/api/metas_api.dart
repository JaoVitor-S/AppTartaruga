import 'package:assistentemovel/domain/meta.dart';
import 'package:dio/dio.dart';

class MetasApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/euDavi01/fake-api-davi';
  //esse é só o endereço base, ainda falta dizer o recurso que vai ser utilizado

  Future<List<Meta>> listarMetas() async {
    //metodo que vai retornar a lista inteira de metas, em formato json

    final response = await dio.get('$baseUrl/metas');

    List<Meta> listaMetas = [];

    for (var json in response.data) {
    //percorre toda a lista de metas no formato json

      Meta meta = Meta.fromJson(json);
      //transforma o json em um objeto (meta)
      listaMetas.add(meta);

    }

    return listaMetas;

  }
}