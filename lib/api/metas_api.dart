import 'package:assistentemovel/domain/meta.dart';
import 'package:dio/dio.dart';

class MetasApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/euDavi01/fake-api-davi';

  Future<List<Meta>> listarMetas() async {
    final response = await dio.get('$baseUrl/metas');

    // Percorrer a lista de elementos
    List<Meta> listaMetas = [];
    for (var json in response.data) {
      // Criar a Meta usando NamedConstructor
      Meta meta = Meta.fromJson(json);

      // Add Meta na Lista
      listaMetas.add(meta);
    }

    return listaMetas;
  }
}