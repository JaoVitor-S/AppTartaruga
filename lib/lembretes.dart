import 'package:flutter/material.dart';
import 'lembrete.dart';
import 'lembrete_dao.dart';
import 'editlembretes.dart';
import 'adclembretes.dart';

class Lembretes extends StatefulWidget {
  const Lembretes({super.key});

  @override
  State<Lembretes> createState() => _LembretesState();
}

class _LembretesState extends State<Lembretes> {
  List<Lembrete> listaLembretes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaLembretes = await LembreteDao().listarLembretes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text(
          "Assistente Acadêmico",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: ListView.builder(
          itemCount: listaLembretes.length,
          itemBuilder: (context, i) {
            final lembrete = listaLembretes[i];
            return Card(
              child: ListTile(
                title: Text(lembrete.titulo),
                subtitle: Text("${lembrete.horario}\n${lembrete.data}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditLembretes(lembrete: lembrete),
                          ),
                        ).then((_) => loadData());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await LembreteDao().deletarLembrete(lembrete.id!);
                        loadData();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AdcLembretes()),
          ).then((_) => loadData());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
