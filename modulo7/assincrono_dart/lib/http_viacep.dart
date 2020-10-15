import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<void> run() async {
  var url = 'https://viacep.com.br/ws/36880071/json/';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    // var itemCount = jsonResponse['totalItems'];
    // print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
