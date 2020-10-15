import 'package:estados_cidades_api/model/cidade_model.dart';
import 'package:estados_cidades_api/model/estado_model.dart';
import 'package:estados_cidades_api/utils/constants.dart';
import 'package:mysql1/mysql1.dart';

class MysqlDb {
  MySqlConnection _conn;

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'root',
        db: 'desafio_dart_modulo7');

    return await MySqlConnection.connect(settings);
  }

  Future<void> createIbgeSchema() async {
    try {
      // apaga banco de dados se existir, para não gerar duplicidade
      // esta ordem não gera excessão devido às chaves extrangeiras
      _conn = await getConnection();
      //await conn.query('USE desafio_dart_modulo7');
      await _conn.query('DROP TABLE IF EXISTS cidade');
      await _conn.query('DROP TABLE IF EXISTS estado');
      await _conn.query('DROP TABLE IF EXISTS pais');

      // cria a tabela pais
      await _conn.query('''CREATE TABLE IF NOT EXISTS pais(
      id INT PRIMARY KEY NOT NULL,
      nome VARCHAR(200) NOT NULL)''');

      // cadastra Brasil se necessário
      var brasil =
          await _conn.query('SELECT * from pais WHERE nome=?', ['Brasil']);
      if (brasil.isEmpty) {
        await _conn.query('INSERT INTO pais (id, nome) values (?, ?);',
            [BRASIL_ID, 'Brasil']);
      }

      // cria tabela estado
      await _conn.query('''CREATE TABLE IF NOT EXISTS estado(
      id INT PRIMARY KEY NOT NULL,
      pais_id INT,
      nome VARCHAR(200) NOT NULL,
      sigla VARCHAR(2) NOT NULL,
      FOREIGN KEY (pais_id) REFERENCES pais(id))''');

      // cria tabela distrito
      await _conn.query('''CREATE TABLE IF NOT EXISTS cidade(
      id INT PRIMARY KEY NOT NULL,
      estado_id INT,
      nome VARCHAR(200) NOT NULL,
      FOREIGN KEY (estado_id) REFERENCES estado(id))''');
    } catch (e) {
      print('Erro na criação do banco de dados: $e');
      throw Exception(e);
    } finally {
      await _conn.close();
    }
  }

  Future<void> cadastrarEstado(EstadoModel estado) async {
    try {
      _conn = await getConnection();
      await _conn.query(
          'insert into estado (id, pais_id, sigla, nome) values (?, ?, ?, ?)',
          [estado.id, estado.paisId, estado.sigla, estado.nome]);
    } on Exception catch (e) {
      print('Erro no cadastro de estado: $e');
      throw Exception(e);
    } finally {
      await _conn.close();
    }
  }

  Future<void> cadastrarCidade(CidadeModel cidade) async {
    try {
      _conn = await getConnection();
      await _conn.query(
          'insert into cidade (id, estado_id, nome) values (?, ?, ?)',
          [cidade.id, cidade.estadoId, cidade.nome]);
    } on Exception catch (e) {
      print('Erro no cadastro de cidade: $e');
      throw Exception(e);
    } finally {
      await _conn.close();
    }
  }
}
