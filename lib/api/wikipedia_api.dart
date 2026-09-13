import 'package:assistentemovel/domain/curiosidade_wikipedia.dart';
import 'package:dio/dio.dart';

class WikipediaApi {
  final dio = Dio();
  final baseUrl = 'https://pt.wikipedia.org/api/rest_v1/page/random/summary';

  Future<CuriosidadeWikipedia> buscarCuriosidade() async {
    late CuriosidadeWikipedia curiosidade;
    final response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      curiosidade = CuriosidadeWikipedia.fromJson(response.data);
    }

    return curiosidade;
  }
}