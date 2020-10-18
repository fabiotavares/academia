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
    return MaterialApp(
      title: 'Desafio do gás',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        PedidoPage.routeName: (_) => PedidoPage(),
      },
    );
  }
}
