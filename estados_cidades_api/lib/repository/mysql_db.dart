import 'package:estados_cidades_api/model/cidade_model.dart';
import 'package:estados_cidades_api/model/estado_model.dart';
import 'package:estados_cidades_api/utils/constants.dart';
import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'root',
      db: 'desafio_dart_modulo7');

  return await MySqlConnection.connect(settings);
}

Future<void> createNewMunicipiosBrasilDb() async {
  var conn = await getConnection();

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

  // cadastra Brasil se necessário
  var brasil = await conn.query('SELECT * from pais WHERE nome=?', ['Brasil']);
  if (brasil.isEmpty) {
    await conn.query(
        'INSERT INTO pais (id, nome) values (?, ?);', [BRASIL_ID, 'Brasil']);
  }

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

  await conn.close();
}

Future<void> cadastrarEstado(List<dynamic> estados) async {
  var conn = await getConnection();

  estados.forEach((estadoMap) async {
    var estado = EstadoModel.fromMap(estadoMap);
    await conn.query(
        'insert into estado (id, pais_id, sigla, nome) values (?, ?, ?, ?)',
        [estado.id, estado.paisId, estado.sigla, estado.nome]);
  });

  await conn.close();
}

Future<void> cadastrarCidade(int estadoId, List<dynamic> cidades) async {
  var conn = await getConnection();

  cidades.forEach((cidadeMap) async {
    var cidade = CidadeModel.fromMap(estadoId, cidadeMap);
    await conn.query(
        'insert into cidade (id, estado_id, nome) values (?, ?, ?)',
        [cidade.id, cidade.estadoId, cidade.nome]);
  });

  await conn.close();
}
