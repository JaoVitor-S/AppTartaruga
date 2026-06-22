class Meta{
  late int id;
  late String titulo;
  late int concluida; //1-tarefa feita 0-tarefa nao concluida.


  Meta({
    required this.id,
    required this.titulo,
    required this.concluida,
});

  Meta.fromJson(Map<String, dynamic>json){
    id = json['id'];
    titulo = json['titulo'];
    concluida = json['concluida'];
  }
}