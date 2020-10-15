import 'package:dio/dio.dart';
import 'package:estados_cidades_api/repository/mysql_db.dart' as mysql_db;
import 'package:estados_cidades_api/utils/constants.dart';

void fetchEstadosCidades() async {
  // obtém a lista de estados cadastrados
  var estadosId = await getEstados();

  // obtém a lista de cidades de cada estado
  if (estadosId != null) {
    await getCidades(estadosId);
  }
}

// obtém a lista de estados do país passado por parâmetro (Brasil = 1)
// e retorna uma lista com os ids dos estados
Future<List<int>> getEstados() async {
  try {
    var dio = Dio();
    var response = await dio.get(URL_ESTADOS);
    var estadosId = <int>[];

    // cadastra estado no banco de dados
    if (response.statusCode == 200) {
      // monte uma lista com todos os ids de estados
      (response.data as List).forEach((estado) {
        estadosId.add(estado['id']);
      });
      // cadastre todos os estados no banco de dados
      await mysql_db.cadastrarEstado(response.data);
      // retorne a lista para ser enviada ao getCidades
      return Future.value(estadosId);
    } else {
      print('Erro no getEstados: ${response.statusCode}');
      return null;
    }
  } on Exception catch (e) {
    print('Erro ao buscar estados: $e');
    return null;
  }
}

Future<void> getCidades(List<int> estadosId) async {
  try {
    var dio = Dio();
    // busca as cidades de cada estado e cadastra no banco de dados
    estadosId.forEach((estadoId) async {
      var response = await dio.get('$URL_ESTADOS/$estadoId/municipios');
      if (response.statusCode == 200) {
        await mysql_db.cadastrarCidade(estadoId, response.data);
      } else {
        print('Erro no getCidades: ${response.statusCode} - estado: $estadoId');
      }
    });
  } on Exception catch (e) {
    print('Erro ao buscar cidades: $e');
    return null;
  }
}
