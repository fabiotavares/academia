import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String nome;

  static String routerName = '/page2';

  const Page2({Key key, @required this.nome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$nome'),
      ),
    );
  }
}
