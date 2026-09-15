class Meta{
  late int id;
  late String titulo;
  late int concluida; //1-tarefa feita 0-tarefa nao concluida.
//late significa que a variável não recebe um valor no momento que foi criada, mas recebe depois

  Meta({
    required this.id,
    required this.titulo,
    required this.concluida,
    //required indica que é obrigatório fornecer o dado pra criação do objeto, caso contrário, dará erro
});

  Meta.fromJson(Map<String, dynamic>json){
    id = json['id'];
    titulo = json['titulo'];
    concluida = json['concluida'];
    //funciona como se ele pegasse o dado cru do banco de dados (ex: json['id']) e converte para uma variável mais 'comum' e facil de manusear

  }
}