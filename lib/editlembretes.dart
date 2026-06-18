import 'package:flutter/material.dart';

  class EditLembretes extends StatelessWidget {
  const EditLembretes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3050),
        title: const Text("Editar Lembrete", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),


      body: Padding(


        padding: const EdgeInsets.all(23),


        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Título",
                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 21),


            TextField(
              decoration: const InputDecoration(
                labelText: "Descrição (opcional)",
                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 21),


            TextField(
              decoration: const InputDecoration(
                labelText: "Data (dd/mm/aaaa)",
                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 21),


            TextField(
              decoration: const InputDecoration(
                labelText: "Horário (00:00)",
                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 17),


            Row(
              children: [
                   ElevatedButton(
                    onPressed: () {},
                    child: const Text("Editar"),
                  ),

                const SizedBox(width: 17),

                   ElevatedButton(
                    onPressed: () {},
                    child: const Text("Cancelar"),
                  ),
              ],
            )
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
