import 'package:estados_cidades_api/model/cidade_model.dart';
import 'package:estados_cidades_api/model/estado_model.dart';
import 'package:estados_cidades_api/utils/constants.dart';
import 'package:mysql1/mysql1.dart';

class MysqlDb {
  static Future<MySqlConnection> _getConnection() async {
    var settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'root',
        db: 'desafio_dart_modulo7');

    return await MySqlConnection.connect(settings);
  }

  static Future<void> createIbgeSchema() async {
    var conn = await _getConnection();
    try {
      // apaga banco de dados se existir, para não gerar duplicidade
      // esta ordem não gera excessão devido às chaves extrangeiras
      //await conn.query('USE desafio_dart_modulo7');
      await conn.query('DROP TABLE IF EXISTS cidade');
      await conn.query('DROP TABLE IF EXISTS estado');
      await conn.query('DROP TABLE IF EXISTS pais');

      // cria a tabela pais
      await conn.query('''CREATE TABLE IF NOT EXISTS pais(
      id INT PRIMARY KEY NOT NULL,
      nome VARCHAR(200) NOT NULL)''');

      // cadastra Brasil
      await conn.query(
          'INSERT INTO pais (id, nome) values (?, ?);', [BRASIL_ID, 'Brasil']);

      // cria tabela estado
      await conn.query('''CREATE TABLE IF NOT EXISTS estado(
      id INT PRIMARY KEY NOT NULL,
      pais_id INT,
      nome VARCHAR(200) NOT NULL,
      sigla VARCHAR(2) NOT NULL,
      FOREIGN KEY (pais_id) REFERENCES pais(id))''');

      // cria tabela distrito
      await conn.query('''CREATE TABLE IF NOT EXISTS cidade(
      id INT PRIMARY KEY NOT NULL,
      estado_id INT,
      nome VARCHAR(200) NOT NULL,
      FOREIGN KEY (estado_id) REFERENCES estado(id))''');
    } catch (e) {
      print('Erro na criação do banco de dados: $e');
      throw Exception(e);
    } finally {
      await conn.close();
    }
  }

  static Future<void> cadastrarEstado(EstadoModel estado) async {
    var conn = await _getConnection();
    try {
      await conn.query(
          'insert into estado (id, pais_id, sigla, nome) values (?, ?, ?, ?)',
          [estado.id, estado.paisId, estado.sigla, estado.nome]);
    } on Exception catch (e) {
      print('Erro no cadastro de estado: $e');
      throw Exception(e);
    } finally {
      await conn.close();
    }
  }

  static Future<void> cadastrarCidade(CidadeModel cidade) async {
    var conn = await _getConnection();
    try {
      await conn.query(
          'insert into cidade (id, estado_id, nome) values (?, ?, ?)',
          [cidade.id, cidade.estadoId, cidade.nome]);
    } on Exception catch (e) {
      print('Erro no cadastro de cidade: $e');
      throw Exception(e);
    } finally {
      await conn.close();
    }
  }
}
