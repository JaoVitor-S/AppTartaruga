import 'package:assistentemovel/db/propriedade_dao.dart';
import 'package:assistentemovel/domain/propriedade.dart';
import 'package:assistentemovel/widget/container_propriedade.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Atividades()
  ));

}

class Atividades extends StatefulWidget {
  const Atividades({super.key});

  @override
  State<Atividades> createState() => _AtividadesState();
}

class _AtividadesState extends State<Atividades> {

  List<Propriedade> listaPropriedades = [];

  @override
  void initState(){
    super.initState();
    loadData();

  }

  Future <void> loadData() async {
    listaPropriedades = await PropriedadeDao().listarPropriedades();
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.only(right: 0)),
            Text("Assistente Acadêmico", style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: Icon(Icons.settings, size: 25, color: const Color(0xFF1E3050),
              ),
            )
          ],
        ),

        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3050),

      ),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 15)),
            const Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 20)),
                Text(
                  "Atividades",
                  style: TextStyle(color: Colors.black, fontSize: 21),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 20)),
                Text(
                  "Visão rápida das próximas entregas e prazos.",
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Expanded(
              child: ListView.builder(
                  itemCount: listaPropriedades.length,
                  itemBuilder: (context, i) {
                    return ContainerPropriedade(propriedade: listaPropriedades[i]);
                  }
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(bottom: 10),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.notifications_none), iconSize: 30),
                Text("Lembretes", style: TextStyle(fontSize: 11),)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.list_alt_outlined, color: const Color(0xFF1E3050)), iconSize: 30),
                Text("Atividades", style: TextStyle(fontSize: 11),)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.group_outlined), iconSize: 30,),
                Text("Grupos", style: TextStyle(fontSize: 11),)
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.person_outline), iconSize: 30,),
                Text("Perfil", style: TextStyle(fontSize: 11),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

