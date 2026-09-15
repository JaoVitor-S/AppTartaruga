import 'package:assistentemovel/domain/curiosidade_wikipedia.dart';
import 'package:dio/dio.dart';

//essa classe é responsavel por tudo oque envolve falar com a api
class WikipediaApi {

  final dio = Dio();

  //dio é a ferramente que vai fazer conexão com a internet
  //e o final diz pro dart que esse dio vai ser usado sempre no código
  //sem precisar ficar criando outro, ele sempre vai usar esse

  final baseUrl = 'https://pt.wikipedia.org/api/rest_v1/page/random/summary';
  //guarda o endereço da api que vamos chamar

  Future<CuriosidadeWikipedia> buscarCuriosidade() async {
    late CuriosidadeWikipedia curiosidade;

    final response = await dio.get(baseUrl);
    //é o comando que faz a requisição, pelo endereço que foi colocada la em cima

    if (response.statusCode == 200) {
      //statuscode serve para verificar como está o servidor
      //evita que carregue uma resposta que venha com um erro (404 ou 500)
      //404 significa que nao foi encontrado
      //500 significa que é um erro no servidor

      curiosidade = CuriosidadeWikipedia.fromJson(response.data);
      //aqui ainda é o dado bruto (em json) no formato de chave
      //transforma o json em um objeto

    }

    return curiosidade;
  }
}