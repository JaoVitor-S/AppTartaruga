import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dominios.dart';
import 'dao.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  static const Color azul = Color(0xFF1E3050);

  final AppDAO _dao = AppDAO();
  ConfiguracaoGeral? _configuracaoAtual;
  List<PeriodoNaoPerturbe> periodosNaoPerturbe = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarDadosDoBanco();
  }

  Future<void> _carregarDadosDoBanco() async {
    final config = await _dao.getConfiguracao();
    final periodos = await _dao.getPeriodos();

    setState(() {
      _configuracaoAtual = config;
      periodosNaoPerturbe = periodos;
      isLoading = false;
    });
  }

  void _atualizarConfiguracao() {
    if (_configuracaoAtual != null) {
      _dao.atualizarConfiguracao(_configuracaoAtual!);
      setState(() {});
    }
  }

  Future<void> _abrirDialogoHorarios({PeriodoNaoPerturbe? periodoEditar}) async {

    final TextEditingController inicioCtrl = TextEditingController(
        text: periodoEditar != null ? periodoEditar.fromTime : '22:00'
    );
    final TextEditingController fimCtrl = TextEditingController(
        text: periodoEditar != null ? periodoEditar.toTime : '07:00'
    );

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(periodoEditar == null ? 'Novo Período' : 'Editar Período'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: inicioCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Horário de Início',
                    hintText: 'Ex: 22:00',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FormatadorHora()],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: fimCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Horário de Fim',
                    hintText: 'Ex: 07:00',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FormatadorHora()],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: azul),
                onPressed: () async {
                  String from = inicioCtrl.text;
                  String to = fimCtrl.text;
                  if (periodoEditar == null) {
                    await _dao.inserirPeriodo(PeriodoNaoPerturbe(fromTime: from, toTime: to));
                  } else {
                    periodoEditar.fromTime = from;
                    periodoEditar.toTime = to;
                    await _dao.atualizarPeriodo(periodoEditar);
                  }

                  Navigator.pop(context);
                  _carregarDadosDoBanco();
                },
                child: const Text('Salvar', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF6F7FB),
        body: Center(child: CircularProgressIndicator(color: azul)),
      );
    }

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
            value: _configuracaoAtual!.somAtivo,
            onChanged: (valor) {
              _configuracaoAtual!.somAtivo = valor;
              _atualizarConfiguracao();
            },
            secondary: const Icon(Icons.volume_up, color: azul),
            activeColor: azul,
          ),
          SwitchListTile(
            title: const Text('Vibração'),
            subtitle: const Text('Ativa/desativa vibração nas notificações'),
            value: _configuracaoAtual!.vibracaoAtiva,
            onChanged: (valor) {
              _configuracaoAtual!.vibracaoAtiva = valor;
              _atualizarConfiguracao();
            },
            secondary: const Icon(Icons.vibration, color: azul),
            activeColor: azul,
          ),
          const Divider(height: 32),
          const Text('Modo Não Perturbe', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Ativar Modo Não Perturbe'),
            subtitle: const Text('Silencia notificações nos períodos definidos'),
            value: _configuracaoAtual!.naoPerturbeAtivo,
            onChanged: (valor) {
              _configuracaoAtual!.naoPerturbeAtivo = valor;
              _atualizarConfiguracao();
            },
            secondary: const Icon(Icons.do_not_disturb_on, color: azul),
            activeColor: azul,
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: periodosNaoPerturbe.length,
            itemBuilder: (context, index) {
              final periodo = periodosNaoPerturbe[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.schedule, color: azul),
                  title: Text('${periodo.fromTime}  →  ${periodo.toTime}'),
                  subtitle: const Text('Período agendado'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => _abrirDialogoHorarios(periodoEditar: periodo),
                        child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.edit, color: Colors.grey)),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () async {
                          if (periodo.id != null) {
                            await _dao.deletarPeriodo(periodo.id!);
                            _carregarDadosDoBanco();
                          }
                        },
                        child: const Padding(padding: EdgeInsets.all(6), child: Icon(Icons.delete, color: Colors.redAccent)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          TextButton.icon(
            onPressed: () => _abrirDialogoHorarios(),
            icon: const Icon(Icons.add, color: azul),
            label: const Text('Adicionar período', style: TextStyle(color: azul)),
          ),
          const Divider(height: 32),
          const Text('Notificações por Grupo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Ativar notificações de grupos'),
            subtitle: const Text('Controla notificações vindas de lembretes compartilhados em grupos'),
            value: _configuracaoAtual!.notificacoesDeGrupo,
            onChanged: (valor) {
              _configuracaoAtual!.notificacoesDeGrupo = valor;
              _atualizarConfiguracao();
            },
            secondary: const Icon(Icons.group, color: azul),
            activeColor: azul,
          ),
          const Divider(height: 32),
          const Text('Google Classroom', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Sincronizar com Google Classroom'),
            value: _configuracaoAtual!.sincronizacaoClassroom,
            onChanged: (valor) {
              _configuracaoAtual!.sincronizacaoClassroom = valor;
              _atualizarConfiguracao();
            },
            secondary: const Icon(Icons.class_, color: azul),
            activeColor: azul,
          ),
          const SizedBox(height: 8),

          ListTile(
            leading: const Icon(Icons.access_time, color: azul),
            title: const Text('Pré‑aviso de prazo (atividades)'),
            subtitle: Text(_configuracaoAtual!.preAvisoClassroom == 0 ? 'Desativado' : '${_configuracaoAtual!.preAvisoClassroom} horas antes'),
            trailing: DropdownButton<int>(
              value: _configuracaoAtual!.preAvisoClassroom,
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
                  _configuracaoAtual!.preAvisoClassroom = novoValor;
                  _atualizarConfiguracao();
                }
              },
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

class FormatadorHora extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String apenasNumeros = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (apenasNumeros.length > 4) {
      apenasNumeros = apenasNumeros.substring(0, 4);
    }

    String textoFinal = '';
    for (int i = 0; i < apenasNumeros.length; i++) {
      textoFinal += apenasNumeros[i];
      if (i == 1 && apenasNumeros.length > 2) {
        textoFinal += ':';
      }
    }

    return TextEditingValue(
      text: textoFinal,
      selection: TextSelection.collapsed(offset: textoFinal.length),
    );
  }
}