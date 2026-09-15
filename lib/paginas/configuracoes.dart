import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  static const Color azul = Color(0xFF1E3050);

  // Estados locais dos Switches
  bool somAtivo = true;
  bool vibracaoAtiva = true;
  bool naoPerturbeAtivo = false;
  bool notificacoesDeGrupo = true;
  bool sincronizacaoClassroom = false;
  int preAvisoClassroom = 4;

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
          onPressed: () => Navigator.pop(context),
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
            onChanged: (valor) => setState(() => somAtivo = valor),
            secondary: const Icon(Icons.volume_up, color: azul),
            activeColor: azul,
          ),
          SwitchListTile(
            title: const Text('Vibração'),
            subtitle: const Text('Ativa/desativa vibração nas notificações'),
            value: vibracaoAtiva,
            onChanged: (valor) => setState(() => vibracaoAtiva = valor),
            secondary: const Icon(Icons.vibration, color: azul),
            activeColor: azul,
          ),
          const Divider(height: 32),
          const Text('Modo Não Perturbe', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Ativar Modo Não Perturbe'),
            subtitle: const Text('Silencia as notificações do aplicativo'),
            value: naoPerturbeAtivo,
            onChanged: (valor) => setState(() => naoPerturbeAtivo = valor),
            secondary: const Icon(Icons.do_not_disturb_on, color: azul),
            activeColor: azul,
          ),
          const Divider(height: 32),
          const Text('Notificações por Grupo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Ativar notificações de grupos'),
            subtitle: const Text('Controla notificações vindas de lembretes compartilhados em grupos'),
            value: notificacoesDeGrupo,
            onChanged: (valor) => setState(() => notificacoesDeGrupo = valor),
            secondary: const Icon(Icons.group, color: azul),
            activeColor: azul,
          ),
          const Divider(height: 32),
          const Text('Google Classroom', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Sincronizar com Google Classroom'),
            value: sincronizacaoClassroom,
            onChanged: (valor) => setState(() => sincronizacaoClassroom = valor),
            secondary: const Icon(Icons.class_, color: azul),
            activeColor: azul,
          ),
          const SizedBox(height: 8),

          ListTile(
            leading: const Icon(Icons.access_time, color: azul),
            title: const Text('Pré‑aviso de prazo (atividades)'),
            subtitle: Text(preAvisoClassroom == 0 ? 'Desativado' : '$preAvisoClassroom horas antes'),
            trailing: DropdownButton<int>(
              value: preAvisoClassroom,
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down, color: azul),
              items: const [
                DropdownMenuItem(value: 0, child: Text('Desativado')),
                DropdownMenuItem(value: 1, child: Text('1 hora')),
                DropdownMenuItem(value: 2, child: Text('2 horas')),
                DropdownMenuItem(value: 4, child: Text('4 horas')),
                DropdownMenuItem(value: 12, child: Text('12 horas')),
                DropdownMenuItem(value: 24, child: Text('24 horas')),
              ],
              onChanged: (novoValor) {
                if (novoValor != null) {
                  setState(() => preAvisoClassroom = novoValor);
                }
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}