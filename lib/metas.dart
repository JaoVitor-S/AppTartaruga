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

                ListTile(
                  leading: Icon(Icons.keyboard_double_arrow_right_sharp),
                  title: Text('Completar o esboço do TCC'),
                  trailing:
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        Icon(Icons.check),
                        SizedBox(width: 12),
                        Icon(Icons.edit),
                        SizedBox(width: 12),
                        Icon(Icons.delete),
                      ]
                    )
                ),
                ListTile(
                    leading: Icon(Icons.keyboard_double_arrow_right_sharp),
                    title: Text('Aprender Inglês'),
                    trailing:
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Icon(Icons.check),
                          SizedBox(width: 12),
                          Icon(Icons.edit),
                          SizedBox(width: 12),
                          Icon(Icons.delete),
                        ]
                    )
                ),
                ListTile(
                    leading: Icon(Icons.keyboard_double_arrow_right_sharp),
                    title: Text('Ler 12 livros no ano'),
                    trailing:
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Icon(Icons.check),
                          SizedBox(width: 12),
                          Icon(Icons.edit),
                          SizedBox(width: 12),
                          Icon(Icons.delete),
                        ]
                    )
                ),
                ListTile(
                    leading: Icon(Icons.keyboard_double_arrow_right_sharp),
                    title: Text('Desenhar por 30 dias'),
                    trailing:
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Icon(Icons.check),
                          SizedBox(width: 12),
                          Icon(Icons.edit),
                          SizedBox(width: 12),
                          Icon(Icons.delete),
                        ]
                    )
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
