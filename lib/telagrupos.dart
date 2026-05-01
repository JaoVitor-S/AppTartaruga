import 'package:flutter/material.dart';

class Grupo {
  String nome;
  List<String> membros;

  Grupo({required this.nome, required this.membros});
}

class GruposScreen extends StatelessWidget {
  GruposScreen({super.key});

  final List<Grupo> _grupos = [
    Grupo(nome: 'Grupo de Geografia', membros: ['Eu', 'Bruno', 'João', 'Weverton']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2A4A),
        elevation: 0,
        title: const Text(
          'Assistente Acadêmico',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Grupos',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 4),
              const Text(
                'Compartilhe lembretes com colegas e organize tarefas',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ...List.generate(_grupos.length, (i) {
                final g = _grupos[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFDDE1EA)),
                  ),
                  child: ListTile(
                    title: Text(
                      g.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text(
                      '${g.membros.length} membros',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.chat_bubble_outline, color: Colors.grey[400], size: 22),
                        const SizedBox(width: 12),
                        Icon(Icons.delete_outline, color: Colors.grey[400], size: 22),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nome do grupo',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: const Color(0xFFEEF0F4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B2A4A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Criar', style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Colors.white,
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