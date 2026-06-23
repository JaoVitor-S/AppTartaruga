class Lembrete {
  int? id;
  late String titulo;
  late String horario;
  late String data;

  Lembrete({this.id, required this.titulo, required this.horario, required this.data});

  Lembrete.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    horario = json['horario'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'horario': horario,
      'data': data,
    };
  }
}
