import 'package:flutter/material.dart';

class Grupo {
  String nome;
  List<String> membros;
  List<Map<String, dynamic>> mensagens;

  Grupo({required this.nome, required this.membros, required this.mensagens});
}

final grupoGeografia = Grupo(
  nome: 'Grupo de Geografia',
  membros: ['Eu', 'Bruno', 'João', 'Weverton'],
  mensagens: [
    {'autor': 'Eu', 'texto': 'Tropa, tem prova de geografia? Se sim, pra qual dia? ', 'souEU': true, 'hora': '20:14'},
    {'autor': 'Bruno', 'texto': 'Tem sim, dia 05/05. O assunto é urbanizacão. Tem três slides no classroom de geografia pra estudar', 'souEU': false, 'hora': '20:17'},
    {'autor': 'João', 'texto': 'Acabei de ver, tem assunto demais', 'souEU': false, 'hora': '20:19'},
    {'autor': 'Weverton', 'texto': 'Cuida estudar', 'souEU': false, 'hora': '20:22'},
  ],
);

class ChatGrupoScreen extends StatelessWidget {
  const ChatGrupoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grupo = grupoGeografia;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2A4A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              grupo.nome,
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              '${grupo.membros.length} membros',
              style: const TextStyle(color: Colors.white60, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              itemCount: grupo.mensagens.length,
              itemBuilder: (context, i) {
                final m = grupo.mensagens[i];
                final souEU = m['souEU'] as bool;
                return Align(
                  alignment: souEU ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
                    decoration: BoxDecoration(
                      color: souEU ? const Color(0xFF1B2A4A) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(14),
                        topRight: const Radius.circular(14),
                        bottomLeft: Radius.circular(souEU ? 14 : 2),
                        bottomRight: Radius.circular(souEU ? 2 : 14),
                      ),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!souEU)
                          Text(
                            m['autor'],
                            style: const TextStyle(color: Color(0xFF1B2A4A), fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        Text(
                          m['texto'],
                          style: TextStyle(color: souEU ? Colors.white : Colors.black87, fontSize: 14),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          m['hora'],
                          style: TextStyle(fontSize: 11, color: souEU ? Colors.white54 : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite uma mensagem...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: const Color(0xFFF2F4F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: const Color(0xFF1B2A4A),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 18),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}