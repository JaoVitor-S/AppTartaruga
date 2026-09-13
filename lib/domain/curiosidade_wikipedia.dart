class CuriosidadeWikipedia {
  late String texto;

  CuriosidadeWikipedia({
    required this.texto,
  });

  // Named Constructor - Construtor Nomeado
  CuriosidadeWikipedia.fromJson(Map<String, dynamic> json) {
    texto = json['extract'];
  }
}