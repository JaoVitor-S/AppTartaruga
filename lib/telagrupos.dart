import 'package:flutter/material.dart';

class TelaGrupos extends StatelessWidget {
  TelaGrupos({super.key});

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2A4A),
        title: const Text('Assistente Acadêmico', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.settings, color: Color(0xFF1B2A4A)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Grupos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Compartilhe lembretes com colegas e organize tarefas.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xFFDDE1EA)),
              ),
              title: const Text('Grupo de Geografia', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('4 membros'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.grey),
                  SizedBox(width: 12),
                  Icon(Icons.delete_outline, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1B2A4A), foregroundColor: Colors.white),
                child: const Text('Criar'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xFF1B2A4A),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: 'Lembretes'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Atividades'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Grupos'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
        onTap: (_) {},
      ),
    );
  }
}