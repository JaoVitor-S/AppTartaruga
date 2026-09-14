class Feriado {
  late String data;
  late String nome;

  Feriado({
    required this.data,
    required this.nome,
  });


  Feriado.fromJson(Map<String, dynamic> json) {
    data = json['date'];
    nome = json['localName'];
  }
}
