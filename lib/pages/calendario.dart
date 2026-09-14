import 'package:assistentemovel/api/feriado_api.dart';
import 'package:assistentemovel/api/prova_api.dart';
import 'package:assistentemovel/domain/feriado.dart';
import 'package:assistentemovel/domain/propriedade.dart';
import 'package:assistentemovel/widget/container_propriedade.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calendario(),
  ));
}

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {

  DateTime today = DateTime.now();


  late Future<List<Feriado>> futureFeriados;


  late Future<List<Propriedade>> futureProvas;

  @override
  void initState() {
    super.initState();
    futureFeriados = FeriadoApi().listarFeriados();
    futureProvas = ProvaApi().listarProvas();
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
              Text(
                "Calendário",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                ),
              ),

              FloatingActionButton(
                onPressed: null,
                backgroundColor: Colors.white,
                shape: const CircleBorder(),

                child: Icon(
                    Icons.settings,
                    size: 25,
                    color: const Color(0xFF1E3050)
                ),
              )
            ],
          ),
          toolbarHeight: 60,
          centerTitle: true,
          backgroundColor: const Color(0xFF1E3050)
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
                rowHeight: 80,
                focusedDay: today,
                firstDay: DateTime(2015, 01, 01),
                lastDay: DateTime(2030, 01, 01)),

            const Padding(padding: EdgeInsets.only(top: 10)),
            const Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "Feriados Nacionais",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),

            // API real - Feriados Nacionais
            FutureBuilder(
              future: futureFeriados,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Feriado> listaFeriados = snapshot.requireData;
                  return buildListaFeriados(listaFeriados);
                }

                return Center(child: CircularProgressIndicator());
              },
            ),

            const Padding(padding: EdgeInsets.only(top: 15)),
            const Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "Provas",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),

            // API fake - Provas
            FutureBuilder(
              future: futureProvas,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Propriedade> listaProvas = snapshot.requireData;
                  return buildListaProvas(listaProvas);
                }

                return Center(child: CircularProgressIndicator());
              },
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
                IconButton(onPressed: null, icon: Icon(Icons.notifications_none), iconSize: 30,),
                Text(
                  "Lembretes",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.list_alt_outlined), iconSize: 30),
                Text(
                  "Atividades",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.group_outlined), iconSize: 30,),
                Text(
                  "Grupos",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.person_outline), iconSize: 30,),
                Text(
                  "Perfil",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildListaFeriados(List<Feriado> listaFeriados) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listaFeriados.length,
      itemBuilder: (context, i) {
        Feriado feriado = listaFeriados[i];
        return ListTile(
          leading: Icon(Icons.event, color: const Color(0xFF1E3050)),
          title: Text(feriado.nome),
          subtitle: Text(feriado.data),
        );
      },
    );
  }

  buildListaProvas(List<Propriedade> listaProvas) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listaProvas.length,
      itemBuilder: (context, i) {
        return ContainerPropriedade(propriedade: listaProvas[i]);
      },
    );
  }
}
