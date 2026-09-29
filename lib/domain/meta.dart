class Meta{
  late int id;
  late String titulo;
  late int concluida;


  Meta({
    required this.id,
    required this.titulo,
    required this.concluida,
    //required diz que é obrigatório fornecer o dado pra criação do objeto, caso contrário, dará erro
});

  Meta.fromJson(Map<String, dynamic>json){
    id = json['id'];
    titulo = json['titulo'];
    concluida = json['concluida'];
    //funciona como se ele pegasse o dado cru da api (ex: json['id']) e converte para uma variável mais 'comum' e facil de manusear

  }
}