class CidadeModel {
  final int id;
  final int estadoId;
  final String nome;

  CidadeModel({
    this.id,
    this.estadoId,
    this.nome,
  });

  static CidadeModel fromMap(int estadoId, Map<String, dynamic> value) {
    try {
      return CidadeModel(
        id: value['id'],
        estadoId: estadoId,
        nome: value['nome'],
      );
    } on Exception catch (e) {
      print('Erro ao obter cidade de mapa: $e');
      return null;
    }
  }
}
