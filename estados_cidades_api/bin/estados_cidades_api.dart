import 'package:estados_cidades_api/repository/dio_restapi.dart';
import 'package:estados_cidades_api/repository/mysql_db.dart';

Future<void> main(List<String> arguments) async {
  /* 
  Script para criação e população do banco de dados com todos os estados do
  Brasil e seus respectivos municípios, tendo como base a API do IBGE.
  As seguintes tabelas serão criadas:
    - pais (id, nome) - contendo apenas o Brasil
    - estados (id, pais_id, nome)
    - cidades (id, estado_id, nome)
    * Nenhum outro dado será considerado nesta implementação.
  */

  // criando banco de dados novo para os municípios do Brasil
  await createNewMunicipiosBrasilDb();

  // buscando dados na API do IBGE para cadastrar no banco de dados
  await fetchEstadosCidades();
}
