import 'package:assistentemovel/domain/feriado.dart';
import 'package:dio/dio.dart';

class FeriadoApi {
  final dio = Dio();
  final baseUrl = 'https://date.nager.at/api/v3/PublicHolidays';

  Future<List<Feriado>> listarFeriados() async {
    final response = await dio.get('$baseUrl/2026/BR');


    List<Feriado> listaFeriados = [];
    for (var json in response.data) {

      Feriado feriado = Feriado.fromJson(json);


      listaFeriados.add(feriado);
    }

    return listaFeriados;
  }
}
