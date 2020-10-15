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

    try {
      // preparando banco de dados
      print('Iniciando...');
      await MysqlDb.createIbgeSchema();
      print('Schema do banco de dados completado...');

      // obtendo a lista de objetos Estados
      print('Buscando lista de estados...');
      final estadosModel = await _getEstadosModel();
      print('Lista de estados concluída...');

      // cadastrando objetos estado no banco de dados
      print('Iniciando cadastramento dos estados...');
      await Future.forEach(estadosModel, (estado) async {
        final estadoModel = (estado as EstadoModel);
        await MysqlDb.cadastrarEstado(estadoModel);
        print('...${estadoModel.nome}');
      });
      print('Cadastro dos estados concluído...');

      // para cada estado, buscar suas cidades e cadastrar no banco de dados
      await Future.forEach(estadosModel, (estado) async {
        final estadoModel = (estado as EstadoModel);

        // buscar lista de cidades do respectivo estado
        print('Iniciando busca de cidades do estado ${estadoModel.nome}...');
        final cidadesModel = await _getCidadesModel(estadoModel.id);
        print('Cidades localizadas...');

        // cadastrando cidades para ao respectivo estado
        print('Iniciando cadastramento das cidades de ${estadoModel.nome}');
        await Future.forEach(cidadesModel, (cidade) async {
          final cidadeModel = (cidade as CidadeModel);
          await MysqlDb.cadastrarCidade(cidadeModel);
          print('...${cidadeModel.nome}');
        });
        print('Processo finalizado com sucesso!');
      });
    } catch (e) {
      print('Erro inesperado: $e');
    }
  }

  static Future<List<EstadoModel>> _getEstadosModel() async {
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
    return Future.value(estadosModel);
  }

  static Future<List<CidadeModel>> _getCidadesModel(int estadoId) async {
    // buscando lista de cidades
    var cidades = await DioRestapi.fetchCidades(estadoId);
    if (cidades == null) {
      throw Exception('Erro ao buscar cidades do estado $estadoId');
    }
    // criando lista de objetos de cidade
    var cidadesModel = <CidadeModel>[];
    cidades.forEach((cidade) {
      cidadesModel.add(CidadeModel.fromMap(estadoId, cidade));
    });
    return Future.value(cidadesModel);
  }
}
