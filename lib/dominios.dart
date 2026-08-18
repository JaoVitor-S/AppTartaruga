class ConfiguracaoGeral {
  int? id;
  bool somAtivo;
  bool vibracaoAtiva;
  bool naoPerturbeAtivo;
  bool notificacoesDeGrupo;
  bool sincronizacaoClassroom;
  int preAvisoClassroom;

  ConfiguracaoGeral({
    this.id,
    required this.somAtivo,
    required this.vibracaoAtiva,
    required this.naoPerturbeAtivo,
    required this.notificacoesDeGrupo,
    required this.sincronizacaoClassroom,
    required this.preAvisoClassroom,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'somAtivo': somAtivo ? 1 : 0,
      'vibracaoAtiva': vibracaoAtiva ? 1 : 0,
      'naoPerturbeAtivo': naoPerturbeAtivo ? 1 : 0,
      'notificacoesDeGrupo': notificacoesDeGrupo ? 1 : 0,
      'sincronizacaoClassroom': sincronizacaoClassroom ? 1 : 0,
      'preAvisoClassroom': preAvisoClassroom,
    };
  }

  factory ConfiguracaoGeral.fromMap(Map<String, dynamic> map) {
    return ConfiguracaoGeral(
      id: map['id'],
      somAtivo: map['somAtivo'] == 1,
      vibracaoAtiva: map['vibracaoAtiva'] == 1,
      naoPerturbeAtivo: map['naoPerturbeAtivo'] == 1,
      notificacoesDeGrupo: map['notificacoesDeGrupo'] == 1,
      sincronizacaoClassroom: map['sincronizacaoClassroom'] == 1,
      preAvisoClassroom: map['preAvisoClassroom'] ?? 4,
    );
  }
}

class PeriodoNaoPerturbe {
  int? id;
  String fromTime;
  String toTime;

  PeriodoNaoPerturbe({this.id, required this.fromTime, required this.toTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fromTime': fromTime,
      'toTime': toTime,
    };
  }

  factory PeriodoNaoPerturbe.fromMap(Map<String, dynamic> map) {
    return PeriodoNaoPerturbe(
      id: map['id'],
      fromTime: map['fromTime'],
      toTime: map['toTime'],
    );
  }

}