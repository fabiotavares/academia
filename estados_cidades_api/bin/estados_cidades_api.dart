import 'package:estados_cidades_api/ibge_controller.dart';

Future<void> main(List<String> arguments) async {
  await IbgeController.getIbgeApi();
}
