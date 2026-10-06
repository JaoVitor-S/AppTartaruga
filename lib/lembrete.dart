class Lembrete {
  int? id;
  late String titulo;
  late String horario;
  late String data;

  Lembrete({
    this.id,
    required this.titulo,
    required this.horario,
    required this.data,
  });

  factory Lembrete.fromJson(Map<String, dynamic> json) {
    return Lembrete(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()),
      titulo: json['titulo'] ?? '',
      horario: json['horario'] ?? '',
      data: json['data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'titulo': titulo,
      'horario': horario,
      'data': data,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}