import 'dart:html';

import 'package:desafio_gas/pages/home_page.dart';
import 'package:desafio_gas/pages/pedido_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'Desafio do Gás';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: title),
      routes: {
        PedidoPage.routeName: (_) => PedidoPage(),
      },
    );
  }
}
