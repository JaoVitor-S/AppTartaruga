import 'package:flutter/material.dart';
import 'lembrete.dart';
import 'lembrete_dao.dart';

class AdcLembretes extends StatelessWidget {
  final tituloController = TextEditingController();
  final horarioController = TextEditingController();
  final dataController = TextEditingController();

  AdcLembretes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Lembrete")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: tituloController, decoration: const InputDecoration(labelText: "Título")),
            TextField(controller: horarioController, decoration: const InputDecoration(labelText: "Horário")),
            TextField(controller: dataController, decoration: const InputDecoration(labelText: "Data")),


            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: () async {
                await LembreteDao().inserirLembrete(
                  Lembrete(titulo: tituloController.text, horario: horarioController.text, data: dataController.text),
                );
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
