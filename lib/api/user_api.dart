import 'package:dio/dio.dart';
import 'package:assistentemovel/dominios/user.dart';

class UserApi {
  final dio = Dio();

  // COLE AQUI O LINK DA SUA API FAKE (passo 1)
  // Exemplo: 'https://my-json-server.typicode.com/SEU_USUARIO/minha_api_fake'
  static const String _url =
      'https://my-json-server.typicode.com/JaoVitor-S/API_fake/users';

  Future<bool> login(String username, String password) async {
    try {
      // Vai buscar os usuários no link da sua API
      final response = await dio.get(_url);

      if (response.statusCode == 200) {
        List<User> listaUsuarios = [];

        // Percorrer o JSON igual o professor fez em PropriedadesApi
        for (var json in response.data) {
          User user = User.fromJson(json);
          listaUsuarios.add(user);
        }

        // Verifica se algum usuário da lista tem o mesmo login e senha digitados
        for (User u in listaUsuarios) {
          if (u.username == username && u.password == password) {
            return true; // Achou e a senha está certa!
          }
        }
      }
      return false; // Não achou ou senha errada
    } catch (e) {
      print('Erro na API: $e');
      return false;
    }
  }
}