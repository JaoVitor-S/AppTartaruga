class Periodo {
  int? id;
  String horaInicio;
  String horaFim;

  Periodo({this.id, required this.horaInicio, required this.horaFim});
  //Construtor que recebe um o JSON vindo do SQLite e converte
  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      //Pega os dados
      id: json['id'],
      horaInicio: json['horaInicio'],
      horaFim: json['horaFim'],
    );
  }
  //Converte Periodo para o SQLite para conseguir salvar/atualizar
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'horaInicio': horaInicio,
      'horaFim': horaFim,
    };
  }
}