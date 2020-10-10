main(List<String> args) {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  // Baseado na lista acima.
  // 1 - Remover os duplicados
  // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
  //     e mostre a quantidade de pessoas com mais de 18 anos
  // 4 - Encontre a pessoa mais velha.

  //1.
  Set<String> pessoasUnicas = pessoas.toSet();
  print('1) Pessoas únicas:');
  pessoasUnicas.forEach((pessoa) => print(pessoa));
  print('');

  // preparação (mapeando as pessoas únicas)
  List<Map<String, String>> pessoasUnicasMapeadas = [];
  pessoasUnicas.forEach((pessoa) {
    final List<String> values = pessoa.split('|');
    pessoasUnicasMapeadas.add({
      'nome': values[0],
      'idade': values[1],
      'sexo': values[2],
    });
  });

  //2.
  final List<Map<String, String>> masculinos = pessoasUnicasMapeadas
      .where((pessoa) => pessoa['sexo'].toLowerCase().startsWith('m'))
      .toList();
  print('2) Total de masculinos: ${masculinos.length}');
  print('');

  //3.
  final List<Map<String, String>> maioresDe18 =
      pessoasUnicasMapeadas.where((pessoa) {
    int idade = int.tryParse(pessoa['idade']);
    if (idade != null && idade > 18) {
      return true;
    }
    return false;
  }).toList();
  print('3) Maiores de 18 anos:');
  maioresDe18.forEach((pessoa) => print(pessoa));
  print('');

  //4.
  pessoasUnicasMapeadas.sort((pessoa1, pessoa2) {
    final idade1 = int.tryParse(pessoa1['idade']);
    final idade2 = int.tryParse(pessoa2['idade']);

    if (idade1 == null || idade2 == null) {
      return 0;
    }

    // ordem decrescente
    return idade2 - idade1;
  });
  print('4) A pessoa mais velha é:');
  print(pessoasUnicasMapeadas.first);
}
