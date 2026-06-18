import 'package:flutter/material.dart';

  class Lembretes extends StatelessWidget {
  const Lembretes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3050),
        title: const Text("Assistente Acadêmico", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),


      body: Padding(


        padding: const EdgeInsets.all(23),


        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Pesquisar lembretes",
                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 13),


            Card(
              child: ListTile(
                title: const Text("Apresentação de Programação Móvel"),
                subtitle: const Text("17:00\n19/05/2026"),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.edit, color: Colors.grey),
                    SizedBox(width: 8),
                    Icon(Icons.delete, color: Colors.red),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 5),

            Card(
              child: ListTile(
                title: const Text("Estudar para Espanhol"),
                subtitle: const Text("21:00\n22/05/2026"),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.edit, color: Colors.grey),
                    SizedBox(width: 8),
                    Icon(Icons.delete, color: Colors.red),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 5),

            Card(
              child: ListTile(
                title: const Text("Fazer exercicios de Matemática"),
                subtitle: const Text("19:15\n21/05/2026"),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.edit, color: Colors.grey),
                    SizedBox(width: 8),
                    Icon(Icons.delete, color: Colors.red),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
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
