import 'package:dio/dio.dart';
import 'package:estados_cidades_api/utils/constants.dart';

class DioRestapi {
  static Future<List<dynamic>> fetchEstados() async {
    // retorna consulta rest por estados
    try {
      var dio = Dio();
      var response = await dio.get(URL_ESTADOS);
      if (response.statusCode == 200) {
        return Future.value(response.data);
      } else {
        return Future.value(null);
      }
    } on Exception catch (e) {
      print('Erro ao buscar estados: $e');
      throw Exception(e);
    }
  }

  static Future<List<dynamic>> fetchCidades(int estadoId) async {
    // retorna consulta rest por estados
    try {
      var dio = Dio();
      var response = await dio.get('$URL_ESTADOS/$estadoId/municipios');
      if (response.statusCode == 200) {
        return Future.value(response.data);
      } else {
        return Future.value(null);
      }
    } on Exception catch (e) {
      print('Erro ao buscar cidades de $estadoId: $e');
      throw Exception(e);
    }
  }
}
