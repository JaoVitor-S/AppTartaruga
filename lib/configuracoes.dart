import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  static const Color azul = Color(0xFF1E3050);

  // Variáveis de estado (em português)
  bool somAtivo = true;
  bool vibracaoAtiva = true;
  bool naoPerturbeAtivo = false;
  bool notificacoesDeGrupo = true;
  bool sincronizacaoClassroom = false;

  // Períodos de Não Perturbe (lista mutável)
  final List<Map<String, String>> periodosNaoPerturbe = [
    {'from': '22:00', 'to': '07:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: azul,
        centerTitle: true,
        title: const Text('Configurações', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Notificações e Som', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          SwitchListTile(
            title: const Text('Som'),
            subtitle: const Text('Ativa/desativa som das notificações'),
            value: somAtivo,
            onChanged: (val) => setState(() => somAtivo = val),
            secondary: const Icon(Icons.volume_up, color: azul),
            activeColor: azul,
          ),

          SwitchListTile(
            title: const Text('Vibração'),
            subtitle: const Text('Ativa/desativa vibração nas notificações'),
            value: vibracaoAtiva,
            onChanged: (val) => setState(() => vibracaoAtiva = val),
            secondary: const Icon(Icons.vibration, color: azul),
            activeColor: azul,
          ),

          const Divider(height: 32),
          const Text('Modo Não Perturbe', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          SwitchListTile(
            title: const Text('Ativar Modo Não Perturbe'),
            subtitle: const Text('Silencia notificações nos períodos definidos'),
            value: naoPerturbeAtivo,
            onChanged: (val) => setState(() => naoPerturbeAtivo = val),
            secondary: const Icon(Icons.do_not_disturb_on, color: azul),
            activeColor: azul,
          ),

          const SizedBox(height: 8),
          for (var periodo in periodosNaoPerturbe)
            Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.schedule, color: azul),
                title: Text('${periodo['from']}  →  ${periodo['to']}'),
                subtitle: const Text('Período agendado'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(onTap: () {}, child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.edit, color: Colors.grey))),
                    const SizedBox(width: 8),
                    InkWell(onTap: () {}, child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.delete, color: Colors.redAccent))),
                  ],
                ),
              ),
            ),

          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, color: azul),
            label: const Text('Adicionar período', style: TextStyle(color: azul)),
          ),

          const Divider(height: 32),
          const Text('Notificações por Grupo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          SwitchListTile(
            title: const Text('Ativar notificações de grupos'),
            subtitle: const Text('Controla notificações vindas de lembretes compartilhados em grupos'),
            value: notificacoesDeGrupo,
            onChanged: (val) => setState(() => notificacoesDeGrupo = val),
            secondary: const Icon(Icons.group, color: azul),
            activeColor: azul,
          ),

          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Trabalho de História'),
            value: true,
            onChanged: (_) {},
            secondary: const Icon(Icons.people_outline, color: azul),
            activeColor: azul,
          ),

          const Divider(height: 32),
          const Text('Google Classroom', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          SwitchListTile(
            title: const Text('Sincronizar com Google Classroom'),
            value: sincronizacaoClassroom,
            onChanged: (val) => setState(() => sincronizacaoClassroom = val),
            secondary: const Icon(Icons.class_, color: azul),
            activeColor: azul,
          ),

          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.access_time, color: azul),
            title: const Text('Pré‑aviso de prazo (atividades Classroom)'),
            subtitle: const Text('4 horas antes'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_drop_down, color: azul),
              onPressed: () {},
            ),
          ),

          const Divider(height: 32),
          const Text('Permissões e Privacidade', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(Icons.privacy_tip, color: azul),
              title: const Text('Permissões e dados sincronizados'),
              subtitle: const Text('Ver e revogar acessos (Classroom, notificações)'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Abrir', style: TextStyle(color: azul)),
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
