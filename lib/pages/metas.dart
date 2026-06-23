import 'package:flutter/material.dart';
import 'dicas.dart';
import '../db/meta_dao.dart';
import '../domain/meta.dart';

class Metas extends StatefulWidget {
  @override
  State<Metas> createState() => _MetasState(); //cria a máquina que faz o recarregamento possível
}

class _MetasState extends State<Metas> {
  List<Meta> listaMetas = [];

  @override
  void initState() { //metodo que é executado quando a tela carrega

    super.initState();

    loadData(); //chama a funçao pra carregar os dados do banco
  }

  loadData() async {

    listaMetas = await MetaDao().listarMetas();

    setState(() {});
    //atualiza os dados da tela


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Assistente Acadêmico.'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Dicas()),
                //funciona como se fosse uma carta por cima de outra carta, podendo tirar a carta de cima pra voltar à de baixo
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        //Corpo da tela: constrói a lista com base nos dados buscados
        itemCount: listaMetas.length,
        //define o tamanho da lista

        itemBuilder: (context, i) {
          //laço de repetição em que, nesse caso, ele vai repetir oq estiver dentro dele até que seja do tamanho da lista
          Meta meta = listaMetas[i];
          //pega a meta correspondente a linha atual
          return ListTile(
            leading: Icon(Icons.keyboard_double_arrow_right_sharp),
            title: Text(meta.titulo),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check),
                SizedBox(width: 12),
                Icon(Icons.edit),
                SizedBox(width: 12),
                Icon(Icons.delete),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 15,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        items: [
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
        ],
      ),
    );
  }
}