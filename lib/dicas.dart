import 'package:flutter/material.dart';

class Dicas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text('Assistente Acadêmico.'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text('Exatas',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
            ),
                ),
                SizedBox(width:20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Busque entender a teoria antes, seja por vídeoaula, livros ou flashcards'),
                      ),

                    ]
                ),
                SizedBox(width:20),
                Row(
                  children:[
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text('Não tente decorar as fórmulas. Faça exercícios suficientes para absorver normalmente a fórmula;'),
                    ),

                  ]
                ),
                SizedBox(width: 20),
                Row(
                  children:[
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text('Pratique diariamente. Não deixe para estudar no dia;'),
                    ),

                  ]
                ),
                SizedBox(width: 20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Revise erros. Assim, você conseguirá dominar o conteúdo alvo, sem ter pontos fracos;'),
                      ),
                    ]
                ),
                SizedBox(width: 20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Utilize gráficos ou simulações. Assim, você irá conseguir compreender melhor conceitos abstratos;'),
                      ),
                    ]
                ),
                SizedBox(width: 20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Tente ensinar o que aprendeu para alguém, pois é uma das melhores formas de fixar o conteúdo.'),
                      )
                    ]
                ),

                SizedBox(width: 20),
                Text('Humanas',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width:20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Absorva o conteúdo e tente explicar com suas palavras;'),
                      ),

                    ]
                ),
                SizedBox(width:20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Busque na internet o que mais cai em provas o assunto alvo;'),
                      ),

                    ]
                ),
                SizedBox(width: 20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Faça o máximo de exercícios após aprender a teoria;'),
                      ),

                    ]
                ),
                SizedBox(width: 20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Varie as fontes: caso for assistir videoaulas, por exemplo, veja videos de professores diferentes.'),
                      ),
                    ]
                ),
                SizedBox(width: 20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Crie mapas mentais (apenas com o que você aprendeu, sem pesquisar);'),
                      ),
                    ]
                ),
                SizedBox(width: 20),
                Row(
                    children:[
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Relacione o assunto com atualidades (caso for história ou sociologia, por exemplo).'),
                      )
                    ]
                )


              ]
            )
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 2,
            items:[
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Lembretes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined),
                label: 'Atividades',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.track_changes),
                label: 'Metas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Perfil',
              ),
            ]
        ),


      );
  }

}