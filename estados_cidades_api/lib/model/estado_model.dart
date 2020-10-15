import 'package:estados_cidades_api/utils/constants.dart';

class EstadoModel {
  final int id;
  final int paisId;
  final String sigla;
  final String nome;

  EstadoModel({
    this.id,
    this.paisId,
    this.sigla,
    this.nome,
  });

  static EstadoModel fromMap(Map<String, dynamic> value) {
    try {
      return EstadoModel(
        id: value['id'],
        paisId: BRASIL_ID,
        sigla: value['sigla'],
        nome: value['nome'],
      );
    } on Exception catch (e) {
      print('Erro ao obter estado de mapa: $e');
      return null;
    }
  }
}
