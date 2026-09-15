import 'package:dio/dio.dart';
import 'package:assistentemovel/dominios/user.dart';

class UserApi {
  final dio = Dio();

  static const String _url =
      'https://my-json-server.typicode.com/JaoVitor-S/API_fake/users';

  Future<bool> login(String username, String password) async {
    try {
      //vai buscar os usuarios no link da sua API
      final response = await dio.get(_url);

      if (response.statusCode == 200) {
        List<User> listaUsuarios = [];

        //percorre o JSON
        for (var json in response.data) {
          User user = User.fromJson(json);
          listaUsuarios.add(user);
        }

        //verificaçao
        for (User u in listaUsuarios) {
          if (u.username == username && u.password == password) {
            return true; //achou e a senha esta certa
          }
        }
      }
      return false; //nao achou ou senha errada
    } catch (e) {
      print('Erro na API: $e');
      return false;
    }
  }

  //busca os usuarios cadastrados na API Fake para exibir na tela com FutureBuilder
  Future<List<User>> buscarUsuarios() async {
    try {
      final response = await dio.get(_url);

      if (response.statusCode == 200) {
        List<User> listaUsuarios = [];

        for (var json in response.data) {
          User user = User.fromJson(json);
          listaUsuarios.add(user);
        }

        return listaUsuarios;
      }
      throw Exception('nao foi possível carregar os usuarios da API Fake');
    } catch (e) {
      throw Exception('erro ao carregar usuarios da API Fake: $e');
    }
  }
}