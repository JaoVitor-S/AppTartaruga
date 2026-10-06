import 'package:dio/dio.dart';
import 'lembrete.dart';

class LembretesApi {
  final dio = Dio();
  final baseUrl = 'https://my-json-server.typicode.com/wevertonn47/fakeapi';

  Future<List<Lembrete>> listarLembretes() async {
    final response = await dio.get('$baseUrl/lembretes');

    List<Lembrete> listaLembretes = [];

    for (var json in response.data) {
      Lembrete lembrete = Lembrete.fromJson(json);
      listaLembretes.add(lembrete);
    }

    return listaLembretes;
  }
}
