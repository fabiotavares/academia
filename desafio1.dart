void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  // Baseado no array acima monte um relatório onde mostre
  // Apresente a quantidade de pacientes com mais de 20 anos
  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.

  // Resposta feita sem validação, assumindo o padrão passado!
  // Quebrando o padrão para obter nomes e idades em arrays separados
  List<String> pacientesNome = [];
  List<String> pacientesIdade = [];

  for (String paciente in pacientes) {
    var pacienteSplit = paciente.split('|');
    pacientesNome.add(pacienteSplit[0]);
    pacientesIdade.add(pacienteSplit[1]);
  }

  // Resposta 1 (mais longa devido à checagem na conversão)
  final maiores20 = pacientesIdade.where((p) => int.parse(p) > 20);
  print('Total de pacientes com mais de 20 anos: ${maiores20.length}');

  // Resposta 2
  // Descobrindo os sobrenomes em runtime
  List<String> sobrenomesDistintos = [];
  for (String nome in pacientesNome) {
    var sobrenome = nome.substring(nome.indexOf(' ') + 1, nome.length);
    if (!sobrenomesDistintos.contains(sobrenome)) {
      sobrenomesDistintos.add(sobrenome);
    }
  }

  for (String sobrenome in sobrenomesDistintos) {
    final membros =
        pacientesNome.where((nome) => nome.contains(sobrenome)).toList();
    print(
        'Família $sobrenome: ${membros.map((e) => e.substring(0, e.indexOf(' ')))}');
  }
}
