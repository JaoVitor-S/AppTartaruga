import 'package:dio/dio.dart';
import 'quote.dart';

class QuoteApi {
  final Dio dio = Dio();

  Future<Quote> buscarFraseMotivacional() async {
    final response = await dio.get('https://dummyjson.com/quotes/random');

    if (response.statusCode == 200) {

      return Quote.fromJson(response.data);
    } else {
      throw Exception('Erro ao carregar frase da API');
    }
  }
}