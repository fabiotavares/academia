import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  static String routerName = '/page1';

  @override
  Widget build(BuildContext context) {
    var nome = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('$nome'),
      ),
    );
  }
}
