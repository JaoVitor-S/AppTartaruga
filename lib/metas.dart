import 'package:flutter/material.dart';
import 'dicas.dart';

class Metas extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text('Assistente Acadêmico.'),
            centerTitle: true,
            titleTextStyle: TextStyle(
            fontSize:24,
        ),
            actions:[
              IconButton(
                icon: Icon(Icons.lightbulb_outline),
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Dicas())

                  );
                },
              ),
            ]

        ),
            body: Column(
              children:[
                Row(
                  children:[
                    Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.black
                    ),
                    SizedBox(width: 10),
                    Text('Completar o esboço do TCC',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),

                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){},
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.eighteen_mp),
                  title: Text('yrr'),
                  subtitle: Text('yrr'),
                  trailing:
                      Icon(Icons.eighteen_mp)


                ),
                Row(
                  children:[
                    Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.black
                    ),
                    SizedBox(width: 10),
                    Text('Aprender inglês',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                    ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){},
                    )
                  ],
                ),
                Row(
                  children:[
                    Icon(
                      Icons.circle,
                      size:10,
                      color: Colors.black
                    ),
                    SizedBox(width: 10),
                    Text('Ler 12 livros no ano',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){},
                    )
                  ]
                ),
                Row(
                    children:[
                      Icon(
                          Icons.circle,
                          size:10,
                          color: Colors.black
                      ),
                      SizedBox(width: 10),
                      Text('Desenhar por 30 dias',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){},
                      ),
                    ]
                ),
              ]

            ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child:
              Icon(
                Icons.add,
                size: 15,
              ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

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
