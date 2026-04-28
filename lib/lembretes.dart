import 'package:flutter/material.dart';

class Lembretes extends StatelessWidget {
  const Lembretes({super.key});

  @override
  Widget build(BuildContext context) {
    final lembretes = [
      {"titulo": "Estudar Matemática.", "detalhe": "12:30\n28/03/2026 - pessoal"},
      {"titulo": "Trabalho de História", "detalhe": "15:20\n30/03/2026 - grupo"},
      {"titulo": "Revisar Física", "detalhe": "19:00\n02/04/2026 - pessoal"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3050),
        title: const Text("Assistente Acadêmico", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: const [Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.settings, color: Colors.white))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar lembretes...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: lembretes.length,
                itemBuilder: (context, index) {
                  final item = lembretes[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(item["titulo"]!),
                      subtitle: Text(item["detalhe"]!),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: Colors.grey),
                          SizedBox(width: 8),
                          Icon(Icons.delete, color: Colors.red),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1E3050),
        child: const Icon(Icons.add, color: Colors.white),
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
