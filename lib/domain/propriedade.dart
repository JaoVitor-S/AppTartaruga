class Propriedade {
  late String materia;
  late String prazo;

  Propriedade({
    required this.materia,
    required this.prazo
  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    materia = json['materia'];
    prazo = json['prazo'];
  }
}