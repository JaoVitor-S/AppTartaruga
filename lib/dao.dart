import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dominios.dart';

class AppDAO {
  static const String tableConfig = 'configuracoes';
  static const String tablePeriodos = 'periodos';

  Future<Database> get db async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'app_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableConfig (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            somAtivo INTEGER,
            vibracaoAtiva INTEGER,
            naoPerturbeAtivo INTEGER,
            notificacoesDeGrupo INTEGER,
            sincronizacaoClassroom INTEGER,
            preAvisoClassroom INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE $tablePeriodos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fromTime TEXT,
            toTime TEXT
          )
        ''');

        await db.insert(tableConfig, {
          'somAtivo': 1,
          'vibracaoAtiva': 1,
          'naoPerturbeAtivo': 0,
          'notificacoesDeGrupo': 1,
          'sincronizacaoClassroom': 0,
          'preAvisoClassroom': 4
        });

        await db.insert(tablePeriodos, {'fromTime': '22:00', 'toTime': '07:00'});
      },
    );
  }

  Future<ConfiguracaoGeral> getConfiguracao() async {
    final banco = await db;
    final List<Map<String, dynamic>> maps = await banco.query(tableConfig, limit: 1);
    if (maps.isNotEmpty) {
      return ConfiguracaoGeral.fromMap(maps.first);
    }
    return ConfiguracaoGeral(somAtivo: true, vibracaoAtiva: true, naoPerturbeAtivo: false, notificacoesDeGrupo: true, sincronizacaoClassroom: false, preAvisoClassroom: 4);
  }

  Future<void> atualizarConfiguracao(ConfiguracaoGeral config) async {
    final banco = await db;
    await banco.update(tableConfig, config.toMap(), where: 'id = ?', whereArgs: [config.id ?? 1]);
  }

  Future<List<PeriodoNaoPerturbe>> getPeriodos() async {
    final banco = await db;
    final List<Map<String, dynamic>> maps = await banco.query(tablePeriodos);
    return List.generate(maps.length, (i) => PeriodoNaoPerturbe.fromMap(maps[i]));
  }

  Future<void> inserirPeriodo(PeriodoNaoPerturbe periodo) async {
    final banco = await db;
    await banco.insert(tablePeriodos, periodo.toMap());
  }

  Future<void> atualizarPeriodo(PeriodoNaoPerturbe periodo) async {
    final banco = await db;
    await banco.update(tablePeriodos, periodo.toMap(), where: 'id = ?', whereArgs: [periodo.id]);
  }

  Future<void> deletarPeriodo(int id) async {
    final banco = await db;
    await banco.delete(tablePeriodos, where: 'id = ?', whereArgs: [id]);
  }
}