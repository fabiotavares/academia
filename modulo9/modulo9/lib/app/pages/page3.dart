import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  static String routerName = '/page3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatButton(
          onPressed: () {
            Navigator.of(context).pop(123456);
          },
          child: Center(child: Text('Fechar Tela'))),
    );
  }
}
