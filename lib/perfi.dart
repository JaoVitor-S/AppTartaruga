import 'package:flutter/material.dart';
import 'configuracoes.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  static const Color azul = Color(0xFF1E3050);

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: azul,
        centerTitle: true,
        title: const Text('Perfil', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Configuracoes()),
                );
              },
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: azul.withOpacity(0.12),
                  child: const Text('J', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                const Expanded(child: Text('João Vitor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                InkWell(onTap: () {}, child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.edit, color: Colors.black54))),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _statCard(label: 'Lembretes\nconcluídos', value: '0', color: azul),
                const SizedBox(width: 10),
                _statCard(label: 'Lembretes\npendentes', value: '0', color: azul),
              ],
            ),
            const SizedBox(height: 16),
            const Align(alignment: Alignment.centerLeft, child: Text('Dias sem atrasos', style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('0 dias'),
                Text('Meta: 30 dias', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: 0.0,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(azul),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: azul,
        unselectedItemColor: azul.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), activeIcon: Icon(Icons.notifications), label: 'Lembretes'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), activeIcon: Icon(Icons.list_alt), label: 'Atividades'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), activeIcon: Icon(Icons.group), label: 'Grupos'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  Widget _statCard({required String label, required String value, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 6),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

}