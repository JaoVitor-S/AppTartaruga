import 'package:flutter/material.dart';
class EditLembretes extends StatelessWidget {
  const EditLembretes({super.key});
  @override
  Widget build(BuildContext context) {
    final campos = [
      {"label": "Título", "linhas": 1},
      {"label": "Descrição (opcional)", "linhas": 2},
      {"label": "Data (dd/mm/aaaa)", "linhas": 1},
      {"label": "Horário (00:00)", "linhas": 1},
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3050),
        title: const Text("Editar Lembrete Salvo", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ...campos.map((c) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                maxLines: c["linhas"] as int,
                decoration: InputDecoration(
                  labelText: c["label"] as String,
                  border: const OutlineInputBorder(),
                ),
              ),
            )),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Editar"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Cancelar"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Lembretes"),
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "Atividades"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Grupos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
