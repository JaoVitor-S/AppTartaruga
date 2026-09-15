import 'package:dio/dio.dart';
import 'package:assistentemovel/dominios/github_user.dart';

class GithubApi {
  final Dio dio = Dio();

  Future<GithubUser> buscarUsuario(String username) async {
    try {
      final response = await dio.get('https://api.github.com/users/$username');

      if (response.statusCode == 200) {
        return GithubUser.fromJson(response.data);
      }
      throw Exception('Usuario não encontrado');
    } catch (e) {
      throw Exception('Erro ao carregar dados do GitHub: $e');
    }
  }
}