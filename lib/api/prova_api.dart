import 'package:assistentemovel/domain/propriedade.dart';
import 'package:dio/dio.dart';

class ProvaApi {
  final dio = Dio();

  final baseUrl = 'https://my-json-server.typicode.com/bruno-rian/prova_api-fake';

  Future<List<Propriedade>> listarProvas() async {
    final response = await dio.get('$baseUrl/provas');


    List<Propriedade> listaProvas = [];
    for (var json in response.data) {

      Propriedade prova = Propriedade.fromJson(json);


      listaProvas.add(prova);
    }

    return listaProvas;
  }
}
