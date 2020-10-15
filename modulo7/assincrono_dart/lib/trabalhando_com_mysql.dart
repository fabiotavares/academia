import 'package:mysql1/mysql1.dart';

Future<void> run() async {
  // await cadastrarAluno();
  await cadastrarAluno();
}

Future<MySqlConnection> getConnection() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'root',
      db: 'curso_dart_flutter');
  return await MySqlConnection.connect(settings);
}

Future<void> cadastrarAluno() async {
  var conn = await getConnection();
  var result = await conn.query(
    'insert into aluno (cd_aluno, nome) values (null, ?)',
    ['Primeiro Aluno'],
  );

  var alunoId = result.insertId;

  result = await conn.query(
    'insert into turma_aluno (turma_id, aluno_id) values (?, ?)',
    [1, alunoId],
  );

  print('Id do aluno cadastrado: $alunoId');
  await conn.close();
}

Future<String> atualizaraluno(int id, String nome) async {
  var conn = await getConnection();
  var result = await conn.query(
    'update aluno set nome=? where cd_aluno =?',
    [nome, id],
  );
  String msg;
  if (result.affectedRows > 0) {
    msg = 'aluno alterado com sucesso';
  } else {
    msg = 'Nenhum aluno encontrado';
  }
  await conn.close();
  return msg;
}
