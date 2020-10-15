import 'package:estados_cidades_api/model/cidade_model.dart';
import 'package:estados_cidades_api/model/estado_model.dart';
import 'package:estados_cidades_api/repository/dio_restapi.dart';
import 'package:estados_cidades_api/repository/mysql_db.dart';

class IbgeController {
  static Future<void> getIbgeApi() async {
    /* 
  Script para criação e população do banco de dados com todos os estados do
  Brasil e seus respectivos municípios, tendo como base a API do IBGE.
  As seguintes tabelas serão criadas:
    - pais (id, nome) - contendo apenas o Brasil
    - estados (id, pais_id, nome)
    - cidades (id, estado_id, nome)
    * Nenhum outro dado será considerado nesta implementação.
  */

    // cria banco de dados novo para os municípios do Brasil
    var db = MysqlDb();
    try {
      // preparando banco de dados
      await db.createIbgeSchema();

      // buscando lista de estados
      var estados = await DioRestapi.fetchEstados();
      if (estados == null) {
        throw Exception('Erro ao buscar estados');
      }
      // criando lista de objetos de estado
      var estadosModel = <EstadoModel>[];
      estados.forEach((element) {
        estadosModel.add(EstadoModel.fromMap(element));
      });
      // cadastrando objetos estado no banco de dados
      estadosModel.forEach((estado) async {
        await db.cadastrarEstado(estado);
        // buscar pelas cidades do estado
        var cidades = await DioRestapi.fetchCidades(estado.id);
        if (cidades == null) {
          throw Exception('Erro ao buscar cidades do estado ${estado.id}');
        } else {
          // criando lista de objetos de cidade
          var cidadesModel = <CidadeModel>[];
          cidades.forEach((element) {
            cidadesModel.add(CidadeModel.fromMap(estado.id, element));
          });
          // cadastrando objetos cidade no banco de dados
          cidadesModel.forEach((cidade) async {
            await db.cadastrarCidade(cidade);
          });
        }
      });
    } catch (e) {
      print('Erro inesperado: $e');
    }
  }
}
