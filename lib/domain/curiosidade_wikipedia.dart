//molde de como vai ser o objeto. Sempre que tiver que
//representar uma curiosidade da wikipedia, ele vai usar essa
//classe como molde

class CuriosidadeWikipedia {
  late String titulo;
  late String texto;

  //o late funciona como uma promessa para o dart
  //ele diz que nesse momento, ele não terá valor
  //mas será atribuído mais tarde
  //caso não fosse utilizado, precisaria colocar String texto = ''

  CuriosidadeWikipedia({
    required this.titulo,
    required this.texto,
    //construtor padrão, diz que caso precisar criar manualmente
    //um objeto, será obrigatório ter titulo e texto.
  });


  CuriosidadeWikipedia.fromJson(Map<String, dynamic> json) {
    titulo = json['title'];
    texto = json['extract'];


    //construtor nomeado, funciona como um dicionario, cada chave é um texto que pode guardar qualquer coisa
    //ele pega o json e traduz para uma variável
    //no caso, o titulo da curiosidade fica dentro de title la na api (json)
    //e aqui, é atribuído a variavel titulo
  }
}