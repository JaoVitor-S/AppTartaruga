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
    {'autor': 'Eu', 'texto': 'Tropa, tem prova de geografia marcada? Pra qual dia?', 'souEU': true, 'hora': '20:14'},
    {'autor': 'Bruno', 'texto': 'Tem sim, dia 05/05. O assunto é urbanização. Têm três slides no classroom de geografia pra estudar', 'souEU': false, 'hora': '20:17'},
    {'autor': 'João', 'texto': 'Já vi os slides, tem coisa demais', 'souEU': false, 'hora': '20:19'},
    {'autor': 'Weverton', 'texto': 'Cuida estudar', 'souEU': false, 'hora': '20:22'},
  ],
);

class TelaChat extends StatelessWidget {
  const TelaChat({super.key});

  @override
  Widget build(BuildContext contexto) {
    final grupo = grupoGeografia;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B2A4A),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () {}),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(grupo.nome, style: const TextStyle(color: Colors.white, fontSize: 15)),
            Text('${grupo.membros.length} membros', style: const TextStyle(color: Colors.white60, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: grupo.mensagens.length,
              itemBuilder: (contexto, indice) {
                final mensagem = grupo.mensagens[indice];
                final souEU = mensagem['souEU'] as bool;
                return Align(
                  alignment: souEU ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: souEU ? const Color(0xFF1B2A4A) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!souEU)
                          Text(mensagem['autor'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Text(mensagem['texto'], style: TextStyle(color: souEU ? Colors.white : Colors.black87)),
                        Text(mensagem['hora'], style: TextStyle(fontSize: 11, color: souEU ? Colors.white54 : Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite uma mensagem...',
                      filled: true,
                      fillColor: const Color(0xFFF2F4F7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
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