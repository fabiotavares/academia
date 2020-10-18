import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CidadesPage extends StatefulWidget {
  static String routerName = '/cidadesPage';

  @override
  _CidadesPageState createState() => _CidadesPageState();
}

class _CidadesPageState extends State<CidadesPage> {
  List<dynamic> cidades;

  @override
  void initState() {
    super.initState();
    // lendo cidades do arquivo em assets
    rootBundle.loadString('assets/cidades.json').then((jsonData) {
      setState(() {
        cidades = json.decode(jsonData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cidades"),
      ),
      body: ListView.builder(
        itemCount: cidades?.length ?? 0,
        itemBuilder: (context, index) => ListTile(
          title: Text(cidades[index]['cidade']),
          subtitle: Text(cidades[index]['estado']),
        ),
      ),
    );
  }
}
