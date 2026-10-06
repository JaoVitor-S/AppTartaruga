import 'package:flutter/material.dart';
import 'lembrete.dart';

class EditLembretes extends StatelessWidget {
  final Lembrete lembrete;
  final tituloController = TextEditingController();
  final horarioController = TextEditingController();
  final dataController = TextEditingController();

  EditLembretes({super.key, required this.lembrete}) {
    tituloController.text = lembrete.titulo;
    horarioController.text = lembrete.horario;
    dataController.text = lembrete.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Lembrete")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: horarioController,
              decoration: const InputDecoration(labelText: "Horário"),
            ),
            TextField(
              controller: dataController,
              decoration: const InputDecoration(labelText: "Data"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Salvar Alterações"),
            ),
          ],
        ),
      ),
    );
  }
}